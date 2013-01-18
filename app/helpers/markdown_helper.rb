module MarkdownHelper
  def markdown source
    markdown_parser.render(source).html_safe
  end

  def markdown_parser
    @parser ||= Redcarpet::Markdown.new Redcarpet::Render::HTML, \
      autolink: true, space_after_headers: true
  end
end
