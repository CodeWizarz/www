<script>
import VSelect from 'vue-select';

export default {
  components: {
    VSelect,
  },
  props: {
    disabled: { type: Boolean, default: false },
    clearable: { type: Boolean, default: false },
    searchable: { type: Boolean, default: false },
    options: { type: Array, required: true },
    label: { type: String, required: true },
    titleField: { type: String, required: true },
    optionValue: { type: Function, required: false },
    value: { default: null } // wrapper for v-model
  }
}
</script>
<template>
  <v-select
    :placeholder="label" :disabled="disabled" :clearable="clearable" :options="options" :searchable="searchable"
    :label="titleField" :value="value" @input="$emit('input', $event)"
  >
    <template slot-scope="option" slot="selected-option">
      <span class="label">
        {{ label }}
      </span>
      <span class="title">
        {{ option[titleField] }}
      </span>
      <span class="subtitle" v-if="optionValue">
        {{ optionValue(option) }}
      </span>
    </template>
    <template slot-scope="option" slot="option">
      <span class="key">
        {{ option[titleField] }}
      </span>
      <span class="value" v-if="optionValue">
        {{ optionValue(option) }}
      </span>
    </template>
  </v-select>
</template>
