require 'colorize'

module Lint
  class HandbookLinkLinter
    require_relative 'handbook_link_linter/linter_error'
    require_relative 'handbook_link_linter/anchor_extractor'
    require_relative 'handbook_link_linter/relative_link_checker'
    require_relative 'handbook_link_linter/bare_anchor_checker'

    def initialize(doc, links)
      @doc = doc
      @links = links
      @errors = []
    end

    attr_reader :errors

    def check
      group_links.each do |checker_klass, elements|
        elements.each do |element|
          checker = checker_klass.new(doc, element)

          @errors += checker.errors unless checker.valid?
        end
      end
    end

    private

    attr_reader :doc, :links

    def group_links
      grouped = Hash.new([])

      links.each do |element|
        link = element.attr['href']

        checker_klass =
          case link
          when %r{^/handbook/}
            ::Lint::HandbookLinkLinter::RelativeLinkChecker
          when /^\#/
            ::Lint::HandbookLinkLinter::BareAnchorChecker
          end

        grouped[checker_klass] += [element] if checker_klass
      end

      grouped
    end
  end
end

rule "LINK", "Link linter failure" do
  tags :links
  check do |doc|
    handbook_links = doc.find_type_elements(:a)

    linter = Lint::HandbookLinkLinter.new(doc, handbook_links)
    linter.check

    linter.errors
  end
end
