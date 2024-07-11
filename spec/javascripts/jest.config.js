const path = require('path');

module.exports = {
  rootDir: path.join(__dirname, '../..'),
  testMatch: ['<rootDir>/spec/javascripts/**/*.spec.js'],
  moduleFileExtensions: ['js', 'json', 'vue'],
  moduleNameMapper: {
    '^(jquery|clipboard|vue-select)$': '<rootDir>/source/javascripts/libs/$1.min.js',
  },
  cacheDirectory: '<rootDir>/tmp/cache/jest',
  restoreMocks: true,
  transform: {
    '^.+\\.js$': 'babel-jest',
    '^.+\\.vue$': 'vue-jest',
  },
};
