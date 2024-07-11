require 'spec_helper'
require_relative '../../helpers/quarters_helper'

describe QuartersHelper do
  class FakeTemplate
    extend QuartersHelper
  end

  describe '#quarters' do
    before do
      Timecop.freeze(Time.local(2023, 10, 15))
    end

    after do
      Timecop.return
    end

    it 'returns the quarters with correct names and end times' do
      quarters = FakeTemplate.quarters
      expect(quarters.map(&:name)).to eq %w[Q3 Q4 Q1 Q2]
      expect(quarters.map(&:ends_at).map(&:to_s)).to eq ["2023-10-31", "2024-01-31", "2024-04-30", "2024-07-31"]
    end
  end
end
