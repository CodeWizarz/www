require 'spec_helper'
require_relative '../../helpers/quality_charts_helpers'

describe QualityChartsHelpers do
  class FakeTemplate
    extend QualityChartsHelpers
  end

  let(:stage) { 'stage' }
  let(:group) { 'group' }
  let(:severities) { %w[s1 s2] }

  describe '.bugs_open_vs_closed_rate_params' do
    subject { FakeTemplate.bugs_open_vs_closed_rate_params(stage: stage, group: group, severities: severities) }

    it 'returns correct params for chart' do
      expect(subject).to eq(
        {
          dashboard: QualityChartsHelpers::BUGS_DASHBOARD_ID,
          chart: QualityChartsHelpers::BUGS_OPEN_VS_CLOSED_RATE_CHART_ID,
          embed: 'v2',
          aggregation: 'monthly',
          daterange: { days: QualityChartsHelpers::DEFAULT_DATE_RANGE },
          filters: [
            { name: 'stage', value: 'stage' },
            { name: 'team_group', value: 'group' },
            { name: 'issue_severity', value: %w[s1 s2] }
          ],
          visible: %w[stage team_group issue_severity]
        })
    end

    describe '.filter_type_for' do
      subject { FakeTemplate }

      it 'returns development_section for dev and development_section' do
        expect(subject.filter_type_for('dev', 'development_section')).to eq 'development_section'
      end

      it 'returns development_section for quality and development_section' do
        expect(subject.filter_type_for('quality', 'development_section')).to eq 'development_section'
      end

      it 'returns group for dev and group' do
        expect(subject.filter_type_for('dev', 'group')).to eq 'team_group'
      end

      it 'returns stage for dev and stage' do
        expect(subject.filter_type_for('dev', 'stage')).to eq 'stage'
      end

      it 'returns group for quality and group' do
        expect(subject.filter_type_for('quality', 'group')).to eq 'team_group'
      end

      it 'returns stage for quality and stage' do
        expect(subject.filter_type_for('quality', 'stage')).to eq 'stage'
      end

      it 'returns group for ux and group' do
        expect(subject.filter_type_for('ux', 'group')).to eq 'team_group'
      end

      it 'returns stage for ux and stage' do
        expect(subject.filter_type_for('ux', 'stage')).to eq 'stage'
      end

      it 'returns group for security and group' do
        expect(subject.filter_type_for('security', 'group')).to eq 'team_group'
      end

      it 'returns stage for security and stage' do
        expect(subject.filter_type_for('security', 'stage')).to eq 'stage'
      end

      it 'returns group for infrastructure and group' do
        expect(subject.filter_type_for('infrastructure', 'group')).to eq 'team_group'
      end

      it 'returns stage for infrastructure and stage' do
        expect(subject.filter_type_for('infrastructure', 'stage')).to eq 'stage'
      end
    end

    context 'without values' do
      subject { FakeTemplate.bugs_open_vs_closed_rate_params }

      it 'returns correct params for chart' do
        expect(subject).to eq(
          {
            dashboard: QualityChartsHelpers::BUGS_DASHBOARD_ID,
            chart: QualityChartsHelpers::BUGS_OPEN_VS_CLOSED_RATE_CHART_ID,
            embed: 'v2',
            aggregation: 'monthly',
            daterange: { days: QualityChartsHelpers::DEFAULT_DATE_RANGE },
            filters: [
              { name: 'issue_severity', value: QualityChartsHelpers::DEFAULT_SEVERITIES }
            ],
            visible: %w[issue_severity]
          })
      end
    end
  end
end
