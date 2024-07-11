module Lint
  class HandbookLinkLinter
    class RelativeLinkChecker
      HANDBOOK_DIRECTORY = File.join(File.expand_path('../../..', __dir__), 'sites/handbook/source/')
      EXCEPTIONS = [
        '/handbook/engineering/projects',
        '/handbook/product/categories',
        '/handbook/business-technology/order-processing',
        '/handbook/marketing/strategic-marketing/competitive/compete'
      ].freeze

      # TODO: delete entries from this list and fix detected failures
      TEMPORARY_IGNORE = [
        '/handbook/business-ops',
        '/handbook/customer-success',
        '/handbook/engineering/infrastructure',
        '/handbook/finance',
        '/handbook/hiring',
        '/handbook/marketing/campaigns',
        '/handbook/marketing/events',
        '/handbook/on-call',
        '/handbook/people-group',
        '/handbook/resellers',
        '/handbook/security',
        '/handbook/support',
        '/handbook/values',
        '/handbook/tools-and-tips'
      ].freeze

      def initialize(doc, element)
        @doc = doc
        @element = element
        @path, @anchor = extract_link_attributes(element)
        @errors = []
      end

      attr_reader :errors

      def valid?
        return true if redirect?(relative_dirname)
        return true if exception?(relative_dirname)
        return true if temporary_ignore?(relative_dirname)

        unless File.directory?(absolute_dirname)
          errors << LinterError.new(element.options[:location], description: "Cannot find directory #{absolute_dirname}".red)
          return false
        end

        filename = Dir.children(absolute_dirname).find { |file| file.start_with?(partial_filename) }

        unless filename
          errors << LinterError.new(element.options[:location], description: "Cannot find #{partial_filename} in #{absolute_dirname}".red)
          return false
        end

        file_path = File.join(absolute_dirname, filename)

        unless File.file?(file_path)
          errors << LinterError.new(element.options[:location], description: "#{file_path} does not exist".red)
          return false
        end

        return true if unsupported_file?(file_path)

        unless correct_anchor?(file_path, anchor)
          errors << LinterError.new(element.options[:location], description: "Anchor #{anchor} cannot be found in #{file_path}".red)
          return false
        end

        true
      end

      private

      attr_reader :doc, :element, :path, :anchor

      def partial_filename
        File.basename(path)
      end

      def relative_dirname
        File.dirname(path)
      end

      def absolute_dirname
        File.join(HANDBOOK_DIRECTORY, relative_dirname)
      end

      def correct_anchor?(path_to_file, anchor)
        return true unless anchor

        anchors = AnchorExtractor.instance.fetch(path_to_file)

        anchors.include?(anchor)
      end

      def redirect?(source)
        redirects.any? { |redirect| redirect.start_with?(source) || source.start_with?(redirect) }
      end

      def exception?(source)
        EXCEPTIONS.include?(source)
      end

      def temporary_ignore?(source)
        TEMPORARY_IGNORE.any? { |ignore| source.start_with?(ignore) }
      end

      def unsupported_file?(file_path)
        file_path.end_with?('.erb', '.haml')
      end

      def extract_link_attributes(element)
        href = element.attr['href']
        path, anchor = href.split('#')

        path = File.join(path, 'index.html') if File.extname(path).empty?

        [path, anchor]
      end

      def redirects
        @redirects ||= YAML.load_file('data/redirects.yml').map { |redirect| redirect['sources'] }.flatten.uniq
      end
    end
  end
end
