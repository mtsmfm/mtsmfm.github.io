require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'activesupport', require: 'active_support/all'
end

require 'pathname'
require 'json'
require 'fileutils'

data = ["2512:C", "1:A", ":C", "2345:B", "1256:E", "1228:A", "5623:B", "8157:C", "74767:E", "88717:D", "148647:A", "374258:H", "6647768:F", "4786317:E", "3456781:C", "225721686547123:C", "2765356148824666:F", "42318287535641783:F", "584423584751745261:D", "8811873415472513884:D", "74817442725737422451:H", "223188865746766511566:C", "2763666483242552567747:F", "76724442325377753577138:E", "327328486656448784712618:B", "4884637666662548114774288:D", "84226765313786654637511248:H", "486142154163288126476238756:A", "1836275732415226326155464567:F", "62544434452376661746517374245:G", "381352782758218463842725673473:B"]

CENTER = {x: 150, y: 150}
MAP = {
  1 => %w(A B),
  2 => %w(B C),
  3 => %w(C D),
  4 => %w(D E),
  5 => %w(E F),
  6 => %w(F G),
  7 => %w(G H),
  8 => %w(H A)
}

def tag(key, body = "", **attrs)
  <<~STR
  <#{key} #{attrs.map {|k, v| "#{k}=#{v.to_s.dump}"}.join(" ")}>
    #{block_given? ? yield : body}
  </#{key}>
  STR
end

def content_tag(*args, **kwargs, &block)
  tag(*args, **kwargs, &block)
end

def draw_base(input)
  tag(:circle, cx: CENTER[:x], cy: CENTER[:y], r: 20, stroke: "black", fill: "none") +
  content_tag(:text, '頂上', x: CENTER[:x], y: CENTER[:y], 'text-anchor': "middle", 'dominant-baseline': "central") +
  8.times.map do |i|
    outputs = []

    theta = (2 * Math::PI) * (i / 8.0)
    x1 = CENTER[:x] + Math.cos(theta) * 100
    y1 = CENTER[:y] - Math.sin(theta) * 100
    x2 = CENTER[:x] + Math.cos(theta) * 20
    y2 = CENTER[:y] - Math.sin(theta) * 20
    outputs << tag(:path, stroke: "black", d: "M#{x1},#{y1}L#{x2},#{y2}")

    char = ?A
    i.times { char.succ! }
    x = CENTER[:x] + Math.cos(theta) * 110
    y = CENTER[:y] - Math.sin(theta) * 110
    outputs << content_tag(:text, char, x: x, y: y, 'text-anchor': "middle", 'dominant-baseline': "central")
    outputs << tag(:circle, cx: x, cy: y, r: 10, stroke: :black, fill: :none)

    char = i + 1
    theta = (2 * Math::PI) * (i / 8.0) + (2 * Math::PI / 16)
    x = CENTER[:x] + Math.cos(theta) * 130
    y = CENTER[:y] - Math.sin(theta) * 130
    outputs << content_tag(:text, char, x: x, y: y, 'text-anchor': "middle", 'dominant-baseline': "central", 'font-size': '0.8rem')

    outputs
  end.join("\n").html_safe +
  content_tag(:text, "入力 #{input}", x: CENTER[:x], y: CENTER[:y] * 2, 'text-anchor': "middle", 'dominant-baseline': "central")
end

def draw_climb(i, order, max_num, options: {})
  i -= 1

  r = (order.quo(max_num) * 60 + 40).to_f

  theta1 = (2 * Math::PI) * (i / 8.0)
  theta2 = (2 * Math::PI) * ((i + 1) / 8.0)
  x1 = CENTER[:x] + Math.cos(theta1) * r
  y1 = CENTER[:y] - Math.sin(theta1) * r
  x2 = CENTER[:x] + Math.cos(theta2) * r
  y2 = CENTER[:y] - Math.sin(theta2) * r
  dx = x2 - x1
  dy = y2 - y1
  f1 = f2 = 0
  start = 0
  rx = ry = r

  d = "M#{x1},#{y1}a#{rx} #{ry} #{start} #{f1} #{f2} #{dx},#{dy}"
  tag(:path, {stroke: "black",  d: d, fill: "none"}.merge(options))
end

def draw_rock(climbs, rock)
  before_r = 20
  outputs = []

  climbs.chars.map(&:to_i).each.with_index do |climb, i|
    if MAP[climb].include?(rock)
      outputs << draw_climb(climb, i, climbs.length, options: {stroke: "red", 'stroke-width': 3, 'stroke-dasharray': '3, 3'})

      theta = (2 * Math::PI) * ((rock.ord - ?A.ord) / 8.0)
      r = (i.quo(climbs.length) * 60 + 40).to_f
      x1 = CENTER[:x] + Math.cos(theta) * before_r
      y1 = CENTER[:y] - Math.sin(theta) * before_r
      x2 = CENTER[:x] + Math.cos(theta) * r
      y2 = CENTER[:y] - Math.sin(theta) * r

      outputs << tag(:path, stroke: "red", d: "M#{x1},#{y1}L#{x2},#{y2}", 'stroke-width': 3, 'stroke-dasharray': '3, 3')

      before_r = r
      rock = (MAP[climb] - [rock]).first
    end
  end

  theta = (2 * Math::PI) * ((rock.ord - ?A.ord) / 8.0)
  r = 100.0
  x1 = CENTER[:x] + Math.cos(theta) * before_r
  y1 = CENTER[:y] - Math.sin(theta) * before_r
  x2 = CENTER[:x] + Math.cos(theta) * r
  y2 = CENTER[:y] - Math.sin(theta) * r

  outputs << tag(:path, stroke: "red", d: "M#{x1},#{y1}L#{x2},#{y2}", 'stroke-width': 3, 'stroke-dasharray': '3, 3')

  outputs.join("\n")
end

def draw_answer(answer)
  answer.chars.map {|man|
    theta = (2 * Math::PI) * ((man.ord - ?A.ord) / 8.0)
    x = CENTER[:x] + Math.cos(theta) * 110
    y = CENTER[:y] - Math.sin(theta) * 110
    tag(:circle, cx: x, cy: y, r: 10, stroke: "red", fill: "none", 'stroke-width': 3)
  }.join("\n")
end

def draw(input, display_rock: false, display_answer: false)
  climbs, rock = input.split(?:)

  svg = content_tag(:svg, xmlns: "http://www.w3.org/2000/svg", width: CENTER[:x] * 2, height: CENTER[:y] * 2.3, viewBox: "0 0 300 300") do
    outputs = [draw_base(input)]

    outputs += climbs.chars.map.with_index do |c, i|
      draw_climb(c.to_i, i, climbs.length)
    end

    outputs << draw_rock(climbs, rock) if display_rock
    outputs << draw_answer(solve(input)) if display_answer

    outputs.join("\n")
  end

  "data:image/svg+xml;base64,#{Base64.encode64(svg).gsub(/\n/,"")}"
end

def solve(input)
  lines, start_rock = input.split(?:)
  lines = lines.chars.map(&:to_i)

  ng_indexes = []

  rock = start_rock
  lines.each.with_index do |l, i|
    if MAP[l].include?(rock)
      rock = (MAP[l] - [rock]).first
      ng_indexes << i
    end
  end

  dead = []

  (?A..?H).each do |man|
    pos = man

    lines.each.with_index.to_a.reverse.each do |l, i|
      if MAP[l].include?(pos)
        if i.in?(ng_indexes)
          dead << man
          break
        else
          pos = (MAP[l] - [pos]).first
        end
      end
    end

    dead << man if !dead.include?(man) && (man == rock || pos == start_rock)
  end

  ((?A..?H).to_a - dead).join
end

out = Pathname.new(__dir__).join("..", "..", "source",  "2016-06-04-doukaku-e04", "doukaku.json")
FileUtils.mkdir_p(out.dirname)
out.write(
  JSON.pretty_generate(
    data.map {|input|
      {input: input, expected: solve(input), image: draw(input, display_rock: true, display_answer: true)}
    }
  )
)
