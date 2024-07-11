module Lint
  class HandbookLinkLinter
    class LinterError
      def initialize(line, description: nil)
        @line = line
        @description = description
      end

      def +(other)
        puts
        puts
        puts @description
        @line += other
      end
    end
  end
end
