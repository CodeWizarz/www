require_relative '../../generators/direction'

describe Generators::Direction do
  context 'GitLabInstance' do
    subject { described_class::GitLabInstance.new('gitlab.com') }

    context '#get' do
      let(:path) { '/projects/1/milestones' }
      let(:url) { 'https://gitlab.com/api/v4/projects/1/milestones?page=1' }
      let(:headers) { { "Content-Type" => "application/json" } }
      let(:payload) { { test: 123 } }

      before do
        subject.cache_store.clear
        stub_request(:get, url).to_return(status: 200, headers: headers, body: payload.to_json)
      end

      it 'caches the path' do
        2.times do
          result = subject.get("projects/1/milestones", true)

          expect(result).to eq('test' => 123)
        end

        expect(WebMock).to have_requested(:get, url).once
      end
    end

    context '#get_single' do
      let(:url) { 'https://gitlab.com/api/v4/projects/1/milestones' }

      before do
        subject.cache_store.clear
        stub_request(:get, url).to_return(status: 500, headers: nil, body: nil)
      end

      # When Faraday encounters a 500 in `#get_single`, we expect the `api_retry` logic to fire.
      # In the spec environment, ENV['API_RETRY_DISABLED'] is set to true, which means we just raise the error.
      # In production, `api_retry` will retry the request with an exponential backoff, and will raise the error if that doesn't work.
      # Check lib/api_retry.rb for implementation details of the module.
      it 'fails fast on API errors' do
        expect do
          subject.get_single("projects/1/milestones")
        end.to raise_error Faraday::Error
      end
    end
  end
end
