module Lint
  class HandbookLinkLinter
    class AnchorExtractor
      PUNCTUATION_REGEXP = /[^\p{Word}\- ]/u
      include Singleton

      def initialize
        @anchors_for_file = {}
        super
      end

      def fetch(filepath)
        return anchors_for_file[filepath] if anchors_for_file.key?(filepath)

        doc = MarkdownLint::Doc.new(File.read(filepath))

        anchors = fetch_from_doc(doc)

        anchors_for_file[filepath] = anchors

        anchors
      end

      def fetch_from_doc(doc)
        used_ids = {}

        anchors = doc.find_type_elements(:header).map do |header|
          header.attr.key?('id') ? header.attr['id'] : string_to_anchor(doc.extract_text(header).first, used_ids)
        end

        anchors += doc.find_type_elements(:li).map { |li| li.attr['id'] }.compact
        anchors += doc.find_type_elements(:img).map { |img| img.attr['id'] }.compact

        # Fetches anchors from <details id=""> and <a name=""> html elements
        anchors += doc.find_type_elements(:html_element).map { |he| he.attr['id'] || he.attr['name'] }.compact

        anchors
      end

      private

      attr_reader :anchors_for_file

      def extract_text_from_link(string)
        result = string.match(/\[(.+?)\]\(.+\)/)

        return result[1] if result

        string
      end

      def string_to_anchor(string, used_ids)
        anchor = extract_text_from_link(string)
                   .strip
                   .downcase
                   .gsub(PUNCTUATION_REGEXP, '') # remove punctuation
                   .gsub(/^\W+/, '')
                   .tr(' ', '-') # replace spaces with dash

        if used_ids.key?(anchor)
          used_ids[anchor] += 1
          anchor = "#{anchor}-#{used_ids[anchor]}"
        else
          used_ids[anchor] = 0
        end

        anchor
      end
    end
  end
end
