require "json"
require "base64"
require "pathname"
require "fileutils"

def tag(key, **attrs)
  <<~STR
  <#{key} #{attrs.map {|k, v| "#{k}=#{v.to_s.dump}"}.join(" ")}>
    #{block_given? ? yield : ""}
  </#{key}>
  STR
end

def draw_base(board_size: 400, padding: 30)
  tag(:svg, xmlns: "http://www.w3.org/2000/svg", width: board_size + padding, height: board_size + padding, viewBox: "-#{padding} -#{padding} #{board_size + padding * 2} #{board_size + padding*2}") do
    outputs = []

    outputs << draw_rect(0, 0, board_size, board_size)

    yield(outputs)

    outputs.join("\n")
  end
end

def draw_rect(x, y, width, height, fill: "none")
  tag(:rect, x: x, y: y, width: width, height: height, style: "fill:#{fill};stroke:black")
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

def draw(input, board_size: 400)
  board = input.chars.reduce([[true]], &method(:process))

  result = draw_base(board_size: board_size) do |outputs|
    delta = board_size / board.size.to_f

    board.each.with_index do |row, y|
      row.each.with_index do |col, x|
        if col
          outputs << draw_rect(x * delta, y * delta, delta, delta, fill: "black")
        end
      end
    end
  end

  "data:image/svg+xml;base64,#{Base64.encode64(result).gsub(/\n/,"")}"
end

data = [
  ["X", "5"],
  ["O", "4"],
  ["XX", "5"],
  ["OX", "10"],
  ["XO", "9"],
  ["XOO", "17"],
  ["OXX", "21"],
  ["OXO", "18"],
  ["OOOX", "130"],
  ["OXXO", "29"],
  ["XXOX", "81"],
  ["XOXXO", "89"],
  ["OOOOX", "630"],
  ["OXOOO", "66"],
  ["OXOXOX", "2001"],
  ["OXOXXO", "417"],
  ["OXXOXX", "1601"],
  ["XXXOXOO", "345"],
  ["OOOOOXO", "3258"],
  ["OXXOXXX", "6401"],
]

out = Pathname.new(__dir__).join("..", "..", "source",  "2016-12-03-doukaku-e10", "doukaku.json")
FileUtils.mkdir_p(out.dirname)
out.write(
  JSON.pretty_generate(
    data.map {|(input, expected)|
      {input: input, expected: expected, image: draw(input)}
    }
  )
)
