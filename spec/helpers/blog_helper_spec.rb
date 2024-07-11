require 'spec_helper'
require_relative '../../helpers/blog_helper'

describe BlogHelper do
  class FakeTemplate
    extend BlogHelper
  end

  describe '#author_data' do
    it 'returns a Gitlab::Homepage::Team::Member instance as a result' do
      author = FakeTemplate.author_data(author: 'A.J. Romaniello')
      expect(author.class).to eq Gitlab::Homepage::Team::Member
    end

    it 'finds a matching team member entry by name' do
      author = FakeTemplate.author_data(author: 'A.J. Romaniello')
      expect(author.name).to eq 'A.J. Romaniello'
    end
  end
end
