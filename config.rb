Time.zone = 'Tokyo'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

activate :syntax, line_numbers: true
activate :livereload, port: '35729', js_host: 'localhost'
activate :blog do |blog|
  blog.layout = 'post'

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end

page '/feed.xml', layout: false

activate :sprockets
if defined? RailsAssets
  RailsAssets.load_paths.each do |path|
    sprockets.append_path path
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = 'master'
  deploy.build_before = true
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-48013282-1'
end
