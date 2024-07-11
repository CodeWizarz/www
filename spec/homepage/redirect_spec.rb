describe Gitlab::Homepage::Redirect do
  describe 'initialize' do
    let(:sources) { ['/foo'] }
    let(:target) { '/bar' }
    let(:comp_op) { '=' }

    subject(:redirect) { described_class.new(sources, target, comp_op) }

    it 'sets the attributes' do
      expect(redirect.sources).to be(sources)
      expect(redirect.target).to be(target)
      expect(redirect.comp_op).to be(comp_op)
    end
  end

  describe '.validate!' do
    it "doesn't fail if the file is valid" do
      expect do
        described_class.validate!(fixture_path('valid.yml'))
      end.not_to raise_error
    end

    it 'fails if there are bad uris' do
      expect do
        described_class.validate!(fixture_path('bad_uris.yml'))
      end.to raise_error(/invalid uri/)
    end

    it 'fails if the sources array is empty' do
      expect do
        described_class.validate!(fixture_path('empty_sources.yml'))
      end.to raise_error(/no sources/)
    end

    it 'fails if the target is empty' do
      expect do
        described_class.validate!(fixture_path('empty_target.yml'))
      end.to raise_error(/no target/)
    end

    it 'fails if there is no sources array' do
      expect do
        described_class.validate!(fixture_path('no_sources.yml'))
      end.to raise_error(/no sources/)
    end

    it 'fails if there is no target' do
      expect do
        described_class.validate!(fixture_path('no_target.yml'))
      end.to raise_error(/no target/)
    end

    it 'fails if there is no comparison operator' do
      expect do
        described_class.validate!(fixture_path('no_comp_op.yml'))
      end.to raise_error(/no comparison operator/)
    end

    it 'fails if there is an unrecognized comparion operator' do
      expect do
        described_class.validate!(fixture_path('invalid_comp_op.yml'))
      end.to raise_error(/invalid comparison operator/)
    end

    it "fails if there's a repeated source" do
      expect do
        described_class.validate!(fixture_path('repeated_source.yml'))
      end.to raise_error(/repeated source/)
    end

    it "fails if there's a repeated target" do
      expect do
        described_class.validate!(fixture_path('repeated_target.yml'))
      end.to raise_error(/repeated target/)
    end

    it "fails if there's a source that's also a target" do
      expect do
        described_class.validate!(fixture_path('loop.yml'))
      end.to raise_error(/can't be a source and a target/)
    end
  end

  def fixture_path(name)
    File.join(__dir__, '..', 'fixtures', 'redirects', name)
  end
end
