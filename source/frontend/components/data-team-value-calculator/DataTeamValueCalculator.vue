<script>
import DataTeamValueSelect from './DataTeamValueSelect.vue';

const getOptionValue = (option) => option.weight;

export default {
  components: {
    DataTeamValueSelect,
  },
  data: function() {
    return {
      strategicAlignments: [
        {
          label: 'None',
          weight: -5,
        },
        {
          label: 'Team',
          weight: 1,
        },
        {
          label: 'Department',
          weight: 2,
        },
        {
          label: 'Division',
          weight: 3,
        },
        {
          label: 'Multiple Divisions (OKR)',
          weight: 4,
        },
        {
          label: 'Company and Community (CEO OKR)',
          weight: 5,
        }
      ],
      legalImpacts: [
        {
          label: 'None',
          weight: -5,
        },
        {
          label: 'Nice to have',
          weight: 1,
        },
        {
          label: 'Must have',
          weight: 2,
        },
        {
          label: 'Fine and/or Brand Damage <$1M',
          weight: 3,
        },
        {
          label: 'Fine and/or Brand Damage <$10M',
          weight: 4,
        },
        {
          label: 'Fine and/or Brand Damage >$10M',
          weight: 5,
        }
      ],
      revenueImpacts: [
        {
          label: '0 or Unknown',
          weight: -5,
        },
        {
          label: '< $5k',
          weight: 1,
        },
        {
          label: '< $50k',
          weight: 2,
        },
        {
          label: '< $500k',
          weight: 3,
        },
        {
          label: '< $5M',
          weight: 4,
        },
        {
          label: '> $5M',
          weight: 5,
        }
      ],
      efficiencyImpacts: [
        {
          label: '0 or Unknown',
          weight: -5,
        },
        {
          label: '< $5k',
          weight: 1,
        },
        {
          label: '< $50k',
          weight: 2,
        },
        {
          label: '< $500k',
          weight: 3,
        },
        {
          label: '< $5M',
          weight: 4,
        },
        {
          label: '> $5M',
          weight: 5,
        }
      ],
      currentStrategicAlignment: null,
      currentLegalImpact: null,
      currentRevenueImpact: null,
      currentEfficiencyImpact: null,
    };
  },
  computed: {
    computedValue: function() {
      if (
        this.currentStrategicAlignment
        && this.currentLegalImpact
        && this.currentRevenueImpact
        && this.currentEfficiencyImpact
      ) {
        const alignmentValue = this.currentStrategicAlignment.weight * 0.1;
        const legalValue = this.currentLegalImpact.weight * 0.2;
        const revenueValue = this.currentRevenueImpact.weight * 0.6;
        const efficiencyValue = this.currentEfficiencyImpact.weight * 0.1;
        return Math.round((alignmentValue + legalValue + revenueValue + efficiencyValue) * 100) / 100; // rounded to 2 decimal points
      } else {
        return 0;
      }
    },
  },
  mounted: function() {
    this.currentStrategicAlignment = this.strategicAlignments[0];
    this.currentLegalImpact = this.legalImpacts[0];
    this.currentRevenueImpact = this.revenueImpacts[0];
    this.currentEfficiencyImpact = this.efficiencyImpacts[0];
  },
  methods: {}
};
</script>
<template>
  <div>
    <div class="col-sm-12">
      <div class="col-sm-6">
        <data-team-value-select
            v-model="currentStrategicAlignment"
            :options="strategicAlignments"
            label="Strategic Alignment"
            title-field="label"
            :option-value="getOptionValue"
          />
      </div>
      <div class="col-sm-6">
        <data-team-value-select
            v-model="currentLegalImpact"
            :options="legalImpacts"
            label="Legal / Regulatory Impact"
            title-field="label"
            :option-value="getOptionValue"
          />
      </div>
      <div class="col-sm-6">
        <data-team-value-select
            v-model="currentRevenueImpact"
            :options="revenueImpacts"
            label="Annual Revenue Impact"
            title-field="label"
            :option-value="getOptionValue"
          />
      </div>
      <div class="col-sm-6">
        <data-team-value-select
            v-model="currentEfficiencyImpact"
            :options="efficiencyImpacts"
            label="Efficiency Impact"
            title-field="label"
            :option-value="getOptionValue"
          />
      </div>
      <div class="col-sm-6">
          <div class="compensation base-compensation-box">
            <div class="base-compensation-box-title">Result</div>
            <div class="base-compensation-box-amount">{{ computedValue }}</div>
          </div>
        </div>
    </div>
  </div>
</template>
