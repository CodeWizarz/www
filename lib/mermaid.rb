require 'kramdown/converter'

module Kramdown
  module Converter
    module MermaidHtmlWrapper
      def convert_codeblock(element, opts)
        if element.options[:lang] == 'mermaid'
          %(<div class="mermaid">#{element.value}</div>)
        else
          super
        end
      end
    end
  end
end

Kramdown::Converter::Html.prepend Kramdown::Converter::MermaidHtmlWrapper
