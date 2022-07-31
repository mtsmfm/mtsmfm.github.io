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

helpers do
  def google_analytics_universal_tag
    <<~TAG
      <script type="text/javascript">
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-48013282-1', 'auto');
        ga('send', 'pageview');
      </script>
    TAG
  end
end
