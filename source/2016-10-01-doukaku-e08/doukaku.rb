class Cell
  attr_reader :x, :y
  delegate :==, :===, :eql?, :equal?, :to_s, to: :@c
  def initialize(c, x, y)
    @c = c
    @x = x
    @y = y
  end

  def <=>(other)
    [x, y] <=> [other.x, other.y]
  end
end

class Board
  attr_reader :width, :height, :board
  delegate :inspect, :map, :[], :[]=, :flatten, to: :board
  def initialize(width, height)
    @width = width
    @height = height
    @board = Array.new(height) {|y| Array.new(width) {|x| Cell.new(?., x, y) } }
  end

  def marked_board(color)
    b = Array.new(height) { Array.new(width) }

    able_rectangles(color).each do |ul, _, _, br|
      (ul.y...br.y).each do |y|
        (ul.x...br.x).each do |x|
          b[y][x] = true
        end
      end
    end

    b
  end

  def able_rectangles(color)
    board.flatten.select {|c| c == color }.sort.combination(4).select do |ul, bl, ur, br|
      next unless ul.x == bl.x && ur.x == br.x && ul.y == ur.y && bl.y == br.y

      (ul.y..br.y).all? do |y|
        (ul.x..br.x).all? do |x|
          board[y][x] == color || board[y][x] == ?.
        end
      end
    end
  end

  def inspect
    "\n" + board.map {|row| row.join(?|) }.join("\n")
  end
end

def parse(input)
  w, b = input.split(?,).map {|str| str.scan(/([a-z]+)(\d+)/).map {|c, d| [c.ord - ?a.ord, d.to_i - 1] } }
  w ||= [[]]
  b ||= [[]]
  [w, b]
end

def solve(input)
  w, b = parse(input)

  width  = [w.max_by(&:first).max || 0, b.max_by(&:first).max || 0].max + 1
  height = [w.max_by(&:last).max || 0, b.max_by(&:last).max || 0].max + 1
  board = Board.new(width, height)

  w.each do |x, y|
    board[y][x] = Cell.new(?w, x, y)
  end if w.flatten.any?

  b.each do |x, y|
    board[y][x] = Cell.new(?b, x, y)
  end if b.flatten.any?

  [
    board.marked_board(?w).flatten.compact.count,
    board.marked_board(?b).flatten.compact.count
  ].join(?,)
end
