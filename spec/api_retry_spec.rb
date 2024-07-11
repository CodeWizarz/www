require 'spec_helper'

describe ApiRetry do
  # Create a dummy class which will extend the ApiRetry module.
  # Extending ApiRetry turns module methods into class methods on dummy_class:
  # https://stackoverflow.com/questions/156362/what-is-the-difference-between-include-and-extend-in-ruby
  let(:dummy_class) { Class.new { extend ApiRetry } }

  describe '#api_retry' do
    context 'when API_RETRY_DISABLED is explicitly disabled' do
      before do
        ENV['API_RETRY_DISABLED'] = 'true'
      end
      it 'should not retry' do
        tries = 0
        expect do
          dummy_class.api_retry do
            tries += 1
            raise RuntimeError
          end
        end.to raise_error RuntimeError
        expect(tries).to eq 1
      end
    end

    context 'when API_RETRY_DISABLED is explicitly enabled' do
      before do
        ENV['API_RETRY_DISABLED'] = 'false'
      end
      it 'should not retry on syntax errors' do
        tries = 0
        expect do
          dummy_class.api_retry do
            tries += 1
            raise NoMethodError
          end
        end.to raise_error NoMethodError
        expect(tries).to eq 1
      end
      it 'should retry five times' do
        tries = 0
        dummy_class.api_retry(wait_time_multiplier: 0) do
          tries += 1
          # There are more classes errors we retry, enumerated in `lib/changelog/api_retry.rb`,
          # but it felt superfluous to retry them all. We could always add those tests later,
          # they would basically look like the ones that already exist in this file.
          raise RuntimeError if tries < 5
        end
        expect(tries).to eq 5
      end

      it 'should raise the specified error' do
        expect do
          dummy_class.api_retry(wait_time_multiplier: 0) do
            raise RuntimeError
          end
        end.to raise_error RuntimeError
      end

      it 'should take at least 10 seconds' do
        expected_timestamp = Time.now + 10
        tries = 0
        dummy_class.api_retry do
          tries += 1
          raise RuntimeError if tries < 5
        end
        expect(Time.now).to be >= expected_timestamp
      end
    end

    context 'when API_RETRY_DISABLED is unset' do
      before do
        ENV.delete('API_RETRY_DISABLED')
      end
      it 'should not retry on syntax errors' do
        tries = 0
        expect do
          dummy_class.api_retry do
            tries += 1
            raise NoMethodError
          end
        end.to raise_error NoMethodError
        expect(tries).to eq 1
      end
      it 'should retry five times' do
        tries = 0
        dummy_class.api_retry(wait_time_multiplier: 0) do
          tries += 1
          raise RuntimeError if tries < 5
        end
        expect(tries).to eq 5
      end
    end
  end
end
