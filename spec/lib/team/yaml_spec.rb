require 'spec_helper'
require_relative '../../../lib/team/yaml'

describe Gitlab::Homepage::Team::Yaml do
  let(:base_dir) do
    path = Pathname.new(__dir__) + '../../fixtures/data'
    path.expand_path
  end

  subject { described_class.new(base_dir) }

  it 'can join a directory of files' do
    fixture = Pathname.new(base_dir / 'team.yml')
    team = YAML.load_file(fixture)

    expect(subject).to receive(:to_file).with(fixture, match_array(team), described_class::HEADER)

    subject.join
  end

  describe '#build_team' do
    let(:base_dir) do
      path = Pathname.new(__dir__) + "../../fixtures/#{fixture}"
      path.expand_path
    end

    context 'the index directories are not all correct' do
      let(:fixture) { 'wrong-index-dir' }

      it 'raises a WrongPlaceError' do
        expect { subject.build_team }
          .to raise_error(Gitlab::Homepage::Team::WrongPlaceError)
      end
    end

    context 'a team member has a slug in their file' do
      let(:fixture) { 'slug-in-file' }

      it 'raises a ForbiddenField' do
        expect { subject.build_team }
          .to raise_error(Gitlab::Homepage::Team::ForbiddenField, /slug/)
      end
    end

    context 'a team member has a type in their file' do
      let(:fixture) { 'type-in-file' }

      it 'raises a ForbiddenField' do
        expect { subject.build_team }
          .to raise_error(Gitlab::Homepage::Team::ForbiddenField, /type/)
      end
    end
  end

  describe 'verify_members!' do
    it 'does not raise' do
      expect { subject.verify_members! }.not_to raise_error
    end

    context 'there are org-chart problems' do
      let(:base_dir) do
        path = Pathname.new(__dir__) + '../../fixtures/bad-org'
        path.expand_path
      end

      it 'raises BadOrgChart' do
        expect { subject.verify_members! }
          .to raise_error(Gitlab::Homepage::Team::BadOrgChart)
      end
    end

    context 'there are bad slugs' do
      let(:base_dir) do
        path = Pathname.new(__dir__) + '../../fixtures/bad-slug'
        path.expand_path
      end

      it 'raises BadFilenames' do
        expect { subject.verify_members! }
          .to raise_error(Gitlab::Homepage::Team::BadFilenames)
      end
    end

    context 'there is a bad index directory' do
      let(:base_dir) do
        path = Pathname.new(__dir__) + '../../fixtures/bad-index'
        path.expand_path
      end

      it 'raises InconsistentTeamError' do
        expect { subject.verify_members! }
          .to raise_error(Gitlab::Homepage::Team::InconsistentTeamError)
      end
    end
  end

  describe '#verify!' do
    it 'does not raise' do
      expect { subject.verify! }.not_to raise_error
    end

    context 'the file are inconsistent' do
      let(:base_dir) do
        path = Pathname.new(__dir__) + '../../fixtures/inconsistent-team'
        path.expand_path
      end

      it 'raises an InconsistentTeamError' do
        expect { subject.verify! }
          .to raise_error(Gitlab::Homepage::Team::InconsistentTeamError)
      end
    end

    context 'there is a bad slug' do
      shared_examples 'bad slug team' do
        ['Bad', 'also bad', 'x'].each do |slug|
          context "The slug is #{slug}" do
            let(:bad_slug_team) do
              [{ 'slug' => slug }]
            end

            it 'raises a BadFilenames error' do
              expect { subject.verify! }
                .to raise_error(Gitlab::Homepage::Team::BadFilenames)
            end
          end
        end
      end

      context 'in the combined file' do
        before do
          allow(subject).to receive(:load_team).and_return(bad_slug_team)
        end

        it_behaves_like 'bad slug team'
      end

      context 'in the split files' do
        before do
          allow(subject).to receive(:build_team).and_return(bad_slug_team)
        end

        it_behaves_like 'bad slug team'
      end
    end
  end
end
