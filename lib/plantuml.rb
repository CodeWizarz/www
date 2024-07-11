require 'kramdown/converter'
require 'nokogiri'
require 'asciidoctor-plantuml'

module Kramdown
  module Converter
    module PlantUmlHtmlWrapper
      def self.plantuml_setup
        Asciidoctor::PlantUml.configure do |conf|
          conf.url = 'https://plantuml.gitlab-static.net'
          conf.png_enable = true
          conf.svg_enable = false
          conf.txt_enable = false
        end
      end

      def convert_codeblock(element, opts)
        if element.options[:lang] == 'plantuml'
          img_tag = Nokogiri::HTML::DocumentFragment.parse(
            Asciidoctor::PlantUml::Processor.plantuml_content(element.value, {})
          )

          %(#{img_tag}\n)
        else
          super
        end
      end
    end
  end
end

Kramdown::Converter::Html.prepend Kramdown::Converter::PlantUmlHtmlWrapper
