module Jekyll
  class NavTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      name, url = @text.split(' ')
      current_url = context["page"]["url"]
      css_class = (url.split('/').last == current_url.split('/').last) ? "current #{name.downcase}" : name.downcase
      "<li class='#{css_class}'><a href='#{url}'>#{name}</a></li>"
    end
  end
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
Liquid::Template.register_tag('nav', Jekyll::NavTag)