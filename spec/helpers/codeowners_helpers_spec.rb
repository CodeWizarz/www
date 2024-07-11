require 'spec_helper'
require_relative '../../helpers/codeowners_helpers'

describe CodeownersHelpers do
  class FakeTemplate
    extend CodeownersHelpers
  end

  describe '#map_to_initials' do
    subject { FakeTemplate.map_to_initials(description) }

    context 'when group name starts with @gl' do
      let(:description) { '@gl-product-leadership' }
      it { is_expected.to eq('G') }
    end

    context 'when group name is nested' do
      let(:description) { '@gitlab-com/gl-security/abuse-team' }

      it { is_expected.to eq('A') }
    end

    context 'when group name is an email' do
      let(:description) { 'hello@gitlab.com' }

      it { is_expected.to eq('H') }
    end

    context 'when description is missing' do
      let(:description) { '' }

      it { is_expected.to eq('N/A') }
    end
  end
end
