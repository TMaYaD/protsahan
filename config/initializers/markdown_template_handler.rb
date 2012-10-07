require "English"

class MarkdownTemplateHandler
  def self.call(template)
    new.render template
  end

  def render(template)
    content, data = read_yaml template.source
    buffer = ""
    data.each do |name, value|
      buffer += "provide :#{name}, #{value.inspect}.html_safe;"
    end

    renderer = Redcarpet::Render::HTML.new
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    buffer += Redcarpet::Markdown.new(renderer, options).render(content).inspect
  end

  # Read the YAML frontmatter.
  def read_yaml(content)
    begin
      if content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
        content = $POSTMATCH
        data = YAML.load($1)
      end
    rescue => e
      puts "YAML Exception reading #{name}: #{e.message}"
    end

    data ||= {}
    content ||= ""

    [content, data]
  end
end
ActionView::Template.register_template_handler(:md, MarkdownTemplateHandler)
