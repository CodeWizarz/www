require 'spec_helper'
require 'securerandom'

describe Gitlab::FileCache do
  let(:logger) { ::Middleman::Logger.singleton }

  # silence logger
  around do |ex|
    old_logger_level = logger.level
    logger.level = Logger::FATAL

    ex.run

    logger.level = old_logger_level
  end

  context 'extends an included class' do
    subject { CachedExampleOne.new }

    class CachedExampleOne
      include Gitlab::FileCache
    end

    it { is_expected.to respond_to :cached, :abort_cache! }
  end

  describe '#cached' do
    subject { CachedExampleTwo.new }

    after do
      subject.cache_store.clear
    end

    class CachedExampleTwo
      include Gitlab::FileCache

      def dynamic_content
        SecureRandom.hex
      end

      def cached_content
        cached('cache_key') do
          dynamic_content
        end
      end
    end

    it 'caches returned value' do
      returned_values = Array.new(10) { subject.cached_content }

      expect { returned_values.uniq.count == 1 }
    end

    it 'logs uncached and cached requests' do
      expect(logger).to receive(:info).with(/cache_key \(not cached\)/)
      expect(logger).to receive(:info).with(/cache_key \(cached\)/)

      2.times { subject.cached_content }
    end
  end

  describe '#abort_cache!' do
    subject { CachedExampleThree.new }

    class CachedExampleThree
      include Gitlab::FileCache

      def dynamic_content
        SecureRandom.hex
      end

      def cached_content
        cached('cache_key') do
          abort_cache!(dynamic_content)
        end
      end
    end

    it 'returns value without caching it' do
      returned_values = Array.new(10) { subject.cached_content }

      expect { returned_values.uniq.count == 10 }
    end

    it 'logs as uncached' do
      expect(logger).to receive(:info).with(/cache_key \(not cached\)/)

      subject.cached_content
    end
  end

  describe '.cache_store_name' do
    context 'when not redefined' do
      subject { CachedExampleFour }

      class CachedExampleFour
        include Gitlab::FileCache
      end

      it 'returns class name' do
        expect(subject.cache_store_name).to eq('CachedExampleFour')
      end
    end

    context 'when redefined' do
      subject { CachedExampleFive }

      class CachedExampleFive
        include Gitlab::FileCache

        set_cache_store 'new name'
      end

      it 'returns redefined name' do
        expect(subject.cache_store_name).to eq('new name')
      end
    end
  end
end
