module MarkdownHelper
  def markdown(content)
    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(hard_wrap: true)
    ).render(content)
  end
end
