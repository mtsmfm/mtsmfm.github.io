def solve(input)
  board = input.chars.reduce([[true]], &method(:process))

  number = 0
  board.each.with_index do |row, y|
    row.each.with_index do |col, x|
      unless col
        fill(board, [[x, y]], number)
        number += 1
      end
    end
  end

  number.to_s
end

def fill(board, positions, number)
  positions.each do |x, y|
    board[y][x] = number if fillable?(board, x, y)
  end

  next_pos = positions.flat_map {|x, y| around(x, y) }.select {|x, y| fillable?(board, x, y) }.uniq

  fill(board, next_pos, number) if next_pos.any?
end

def around(x, y)
  [
    [x,     y + 1],
    [x,     y - 1],
    [x + 1, y],
    [x - 1, y]
  ]
end

def fillable?(board, x, y)
  x < board.size && y < board.size && x >= 0 && y >= 0 && board[y][x].nil?
end

def process(board, char)
  new_board = Array.new(board.size * 3) { Array.new(board.size * 3) }

  board.each.with_index do |row, y|
    row.each.with_index do |col, x|
      if col
        t = y * 3
        c = y * 3 + 1
        b = y * 3 + 2

        l = x * 3
        m = x * 3 + 1
        r = x * 3 + 2

        if char == "X"
          new_board[t][m] =
          new_board[c][l] =
          new_board[c][r] =
          new_board[b][m] = true
        else
          new_board[t][l] =
          new_board[t][r] =
          new_board[c][m] =
          new_board[b][l] =
          new_board[b][r] = true
        end
      end
    end
  end

  new_board
end

def print_board(board)
  board.each do |row|
    row.each do |col|
      print(
        case col
        when true
          "□"
        when nil
          "■"
        else
          col
        end
      )
    end

    puts
  end
end
