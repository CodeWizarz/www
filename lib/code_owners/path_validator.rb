module Gitlab
  module CodeOwners
    class PathValidator
      def initialize(data)
        @data = data
        @errors = []
      end

      attr_reader :errors

      def valid?
        Dir.chdir(::File.expand_path('../..', __dir__)) do
          data.keys.each do |path|
            errors << "Missing path: #{path}. Make sure that this path exist in the repository." unless path_exists?(path)
            errors << "Use `#{path}/` instead of `#{path}` to include files inside of the directory." unless correct_dir?(path)
          end

          errors.none?
        end
      end

      private

      attr_reader :data

      def path_exists?(path)
        Dir[path.delete_prefix('/')].any?
      end

      def correct_dir?(path)
        return true if path.include?('*')
        return true if path.end_with?('/')
        return true unless Dir.exist?(path.delete_prefix('/'))

        false
      end
    end
  end
end
