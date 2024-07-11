require 'spec_helper'
require_relative '../../helpers/cache_bust_helpers'

describe CacheBustHelpers do
  class FakeTemplate
    include CacheBustHelpers
  end

  describe '#cache_bust' do
    it 'raises an error if its input is not a string' do
      input = { 'key' => 'value' }
      template = FakeTemplate.new
      expect { template.cache_bust(input, '1') }.to raise_error(RuntimeError)
    end

    it 'raises an error if it cannot find .css or .js in the string provided' do
      string = 'Some other kind of string'
      template = FakeTemplate.new
      expect { template.cache_bust(string, '1') }.to raise_error(RuntimeError)
    end

    it 'creates a correctly cache-busted string from a script tag' do
      string = '<script src="this.js"></script>'
      template = FakeTemplate.new
      expect(template.cache_bust(string, '1')).to eq('<script src="this.js?cacheBust=1"></script>')
    end

    it 'creates a correctly cache-busted string from a link tag' do
      string = '<link rel="stylesheet" href="this.css">'
      template = FakeTemplate.new
      expect(template.cache_bust(string, '1')).to eq('<link rel="stylesheet" href="this.css?cacheBust=1">')
    end
  end
end
