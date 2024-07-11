# frozen_string_literal: true

describe Gitlab::Homepage::Jobs::JobsListing do
  subject(:jobs_listing) { described_class.new }

  describe '#jobs' do
    subject { jobs_listing.jobs }

    before do
      stub_request(:get, 'https://api.greenhouse.io/v1/boards/Gitlab/embed/jobs?content=true').to_return(body: response.to_json)
    end

    context 'when jobs are available' do
      let(:response) { { jobs: [{ title: 'Area Sales Manager' }] } }

      it { is_expected.to eq([{ title: 'Area Sales Manager' }]) }
    end

    context 'when jobs are missing' do
      let(:response) { {} }

      it { is_expected.to eq([]) }
    end
  end

  describe '#jobs_listing' do
    subject { jobs_listing.jobs_listing }

    before do
      jobs_listing.cache_store.clear
      stub_request(:get, 'https://api.greenhouse.io/v1/boards/Gitlab/embed/departments').to_return(body: response.to_json)
    end

    context 'when a successful response' do
      let(:response) do
        {
          departments: [
            {
              id: 1,
              name: 'Brand and Digital Design',
              child_ids: [],
              jobs: [
                {
                  id: 2,
                  title: "Senior Brand Designer"
                }
              ]
            }
          ]
        }
      end

      it { is_expected.to eq([{ id: 1, jobs: [], name: 'Brand and Digital Design' }]) }
    end
  end

  describe '#list_data' do
    subject { jobs_listing.list_data }

    before do
      stub_request(:get, 'https://api.greenhouse.io/v1/boards/Gitlab/embed/departments').to_return(body: response.to_json)
    end

    context 'when a successful response' do
      let(:response) do
        {
          departments: [
            {
              id: 1,
              name: 'Brand and Digital Design',
              child_ids: [500],
              parent_id: 10,
              jobs: [
                {
                  id: 2,
                  title: "Senior Brand Designer"
                }
              ]
            }
          ]
        }
      end

      it { is_expected.to eq([{ id: 1, jobs: [{ id: 2, title: 'Senior Brand Designer' }], name: 'Brand and Digital Design', parent_id: 10, child_ids: [500] }]) }
    end
  end
end
