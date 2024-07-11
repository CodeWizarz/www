<script>
export default {
  data: function() {
    return {
      beginningArr: 100000000,
      growthPercent: 90,
      departmentValues: [
        { key: 1, target: 15, current: 15, arr: 0, label: 'Cost of Sales' },
        { key: 2, target: 20, current: 0, arr: 0, label: 'R & D' },
        { key: 3, target: 12.5, current: 0, arr: 0, label: 'Marketing' },
        { key: 4, target: 22.5, current: 0, arr: 0, label: 'Sales' },
        { key: 5, target: 10, current: 0, arr: 0, label: 'G & A' },
      ],
      departmentValues_Defaults: [
        { key: 1, target: 15, current: 15, arr: 0, label: 'Cost of Sales' },
        { key: 2, target: 20, current: 0, arr: 0, label: 'R & D' },
        { key: 3, target: 12.5, current: 0, arr: 0, label: 'Marketing' },
        { key: 4, target: 22.5, current: 0, arr: 0, label: 'Sales' },
        { key: 5, target: 10, current: 0, arr: 0, label: 'G & A' },
      ],
    };
  },
  watch: {
    growthPercent: {
      immediate: true,
      handler(newVal, oldVal) {
        this.calculateDepartments();
      },
    },
    beginningArr: {
      immediate: true,
      handler(newVal, oldVal) {
        this.calculateDepartments();
      },
    },
    departmentValues: {
      immediate: true,
      deep: true,
      handler() {
        this.calculateDepartments();
      },
    },
  },
  computed: {
    longTermCosts: function() {
      var vm = this;
      var sum = 0.0;
      var justValues = vm.departmentValues.map((dept) =>
        parseFloat(dept.target)
      );
      for (var x in justValues) {
        if (Number.isNaN(Number.parseFloat(justValues[x]))) {
          continue;
        }
        sum += justValues[x] / 100; //calculate as decimals
      }
      return sum;
    },
    eventualProfitMargin: function() {
      return 1 - this.longTermCosts;
    },
    growthLever: function() {
      var variableNonDelayedCosts = this.departmentValues[0].target / 100;
      return 1 / (this.longTermCosts - variableNonDelayedCosts);
    },
    shortTermCosts: function() {
      var vm = this;
      var sum = 0.0;
      var justValues = vm.departmentValues.map((dept) =>
        parseFloat(dept.current)
      );
      for (var x in justValues) {
        if (Number.isNaN(Number.parseFloat(justValues[x]))) {
          continue;
        }
        sum += justValues[x];
      }
      return sum;
    },
    endingArr: function(){
      return this.beginningArr * this.growthPercent
    },
    longTermProfitPercentage: function(){
      return this.shortTermCosts
    },
    calculateCostOfNewArrPct: function(){
      return this.sum('current');
    },
    calculateCostOfNewArr: function(){
      return this.sum('arr');
    },
    calculateTotalArr: function() {
      return (this.shortTermCosts * this.beginningArr) / 100;
    },
    calculateTotalLongTermArr: function() {
      return this.sum('target');
    },
  },

  methods: {
    sum: function(prop) {
      return this.departmentValues.reduce((acc, curr) => {
        if(curr.label === 'Marketing' || curr.label === 'Sales') {
          return acc + curr[prop];
        } else {
          return acc;
        }
      }, 0)
    },

    resetDataDefaults: function() {
      var vm = this;
      vm.departmentValues = JSON.parse(
        JSON.stringify(vm.departmentValues_Defaults)
      );
      vm.beginningArr = 100000000;
      vm.growthPercent = 90;
      // should trigger re-calc on its own due to the props changing.
      // calculateDepartments();
    },
    calculateDepartments: function() {
      var vm = this;
      vm.departmentValues.map(function(department) {
        var revenuedelta = vm.growthPercent / 100 - vm.eventualProfitMargin; // turn input growth to growth rate (at 80%)
        // console.log("revenue delta formula: " + vm.growthPercent / 100  + " - " + vm.eventualProfitMargin + " = " + revenuedelta + "%");
        var deptarget = department.target / 100;
        var current_percent =
          revenuedelta * vm.growthLever * deptarget + deptarget;
        // console.log(department.label + ' formula: ( ( ' + revenuedelta + ' * ' + vm.growthLever + ') * ' + deptarget + ' ) + ' + deptarget + ' = ' + current_percent);
        if (department.key == 1) {
          // cost of sales is fixed.
          current_percent = deptarget;
        }
        department.current = current_percent * 100; // chage 0.xx per cent to xx% for readability/input
        // Map that rate to the input arr figure
        department.arr = vm.beginningArr * current_percent;
      });
    },
    formatArr: function(arr) {
      if (Number.isNaN(Number.parseFloat(arr))) return 'Not Dollars';
      var amount = parseFloat(arr).toFixed(2);
      return '$' + amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
    formatPercent: function(percent) {
      if (Number.isNaN(Number.parseFloat(percent))) return 'Not Percent';
      var amount = parseFloat(percent);
      var ret = amount.toFixed(2);
      return ret.replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '%';
    },
  },
};
</script>
<template>
  <div class="hypergrowth-calculator">
    <div class="row margin-bottom20">
      <div class="col-md-4">
        <h4>Growth Rate</h4>
        <input
          v-model="growthPercent"
          class="input-growth-rate"
          type="number"
        />
        <span class="input-format-label">%</span>
      </div>
      <div class="col-md-8">
        <h4>Yearly Revenue</h4>
        <div class="flex-container space-between">
          <div>
            <span class="input-format-label">$</span>
            <input
              v-model.number="beginningArr"
              class="input-arr"
              type="number"
            />
            <small class="input-arr-label light">{{
              formatArr(beginningArr)
            }}</small>
          </div>
          <button class="btn btn-primary" @click="resetDataDefaults()">
            Reset
          </button>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-12">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th>Department</th>
                <th>Long term %</th>
                <th>This year %</th>
                <th>This year $</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="department in departmentValues" :key="department.key">
                <td>{{ department.label }}</td>
                <td class="row">
                  <input
                    v-model.number="department.target"
                    class="col-sm-12"
                    type="number"
                    step=".5"
                  />
                </td>
                <td>{{ formatPercent(department.current) }}</td>
                <td>{{ formatArr(department.arr) }}</td>
              </tr>
              <tr>
              <td><b>Total costs</b></td>

              <td><b>{{ formatPercent(longTermCosts * 100) }}</b></td>
              <td><b>{{ formatPercent(shortTermCosts) }}</b></td>
              <td><b>{{ formatArr(calculateTotalArr) }}</b></td>
            </tr>
            <tr>
              <td>Next year's revenue</td>
              <td></td>
              <td>{{ formatPercent(growthPercent + 100) }}</td>
              <td>{{ formatArr(beginningArr * (1 + (growthPercent / 100))) }}</td>
            </tr>
            <tr>
              <td>Profit</td>
              <td>{{ formatPercent((1 - longTermCosts) * 100) }}</td>
              <td>{{ formatPercent((100 - shortTermCosts)) }}</td>
              <td>{{ formatArr(beginningArr - calculateTotalArr) }}</td>
            </tr>
            <tr>
              <td>Revenue Growth</td>
              <td></td>
              <td>{{ formatPercent(growthPercent) }}</td>
              <td>{{ formatArr((beginningArr * growthPercent) / 100) }}</td>
            </tr>
            <tr>
              <td>Cost of new ARR (Sales + Marketing costs)</td>
              <td>{{ formatPercent(calculateTotalLongTermArr) }}</td>
              <td>{{ formatPercent(calculateCostOfNewArrPct) }}</td>
              <td>{{ formatArr(calculateCostOfNewArr) }}</td>
            </tr>

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
 .hypergrowth-calculator .input-growth-rate {
    width: 8rem;
  }
  .hypergrowth-calculator .input-arr {
    width: 12rem;
  }
  .hypergrowth-calculator .input-arr-label {
    margin-left: 1rem;
  }
  .hypergrowth-calculator .input-format-label {
    margin: 0 .5rem;
  }
</style>
