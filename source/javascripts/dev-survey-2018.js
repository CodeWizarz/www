/* global Chart, deepmerge, jQuery, verge, Sektor, basicScroll */
(function($) {
  Chart.defaults.global.tooltips.enabled = false;

  var SectionNavigation = {
    darkBlocks: [],
    $sectionNavItems: [],
    init: function() {
      SectionNavigation.setup();
    },
    setup: function() {
      this.$sectionNavItems = $('.section-navigation a');
      this.darkBlocks = $('.dark-bg-block').get();
      this.$sectionNavItems.each(function() {
        var id = this.hash;
        var $navItem = $(this);

        if ( id.substr(0, 1) === '#' ) {
          id = id.substr(1);
        }

        var $section = $('#' + id);
        $navItem.data('section', $section);
        $navItem.on('click', function(event) {
          event.preventDefault();
          window.scroll({ top: $section.position().top, behavior: 'smooth' });
        });
      });
      this.checkOverlaps();
      window.an_OnScroll.addFunction(this.checkOverlaps);
    },
    checkOverlaps: function() {
      var self = SectionNavigation;
      var darkRects = [];
      self.darkBlocks.forEach(function(block) {
        darkRects.push(verge.rectangle(block));
      });
      self.$sectionNavItems.each(function() {
        var $navItem = $(this);
        var navRect = verge.rectangle(this);
        var overlaps = false;
        darkRects.forEach(function(darkRect) {
          if ( self.rectsOverlap(navRect, darkRect) ) {
            overlaps = true;
          }
        });
        if (overlaps) {
          $navItem.addClass('js-reverse');
        } else {
          $navItem.removeClass('js-reverse');
        }

        var sectionRect = verge.rectangle($navItem.data('section'));
        if ( self.rectsOverlap(navRect, sectionRect) ) {
          $navItem.addClass('js-active');
        } else {
          $navItem.removeClass('js-active');
        }
      });
    },
    rectsOverlap: function(navRect, sectionRect) {
      return navRect.top > sectionRect.top - 20 && navRect.bottom < sectionRect.bottom;
    }
  };
  $(SectionNavigation.init);

  var percentFormatter = function(value) {
    return value + '%';
  };

  var top3ChallengesData = {
    labels: [
      'Selecting the right technology',
      'Integration with other tools in our stack',
      'Insufficient or poor internal processes'
    ],
    datasets: [ {
      backgroundColor: [ '#fa7035', '#e04733', '#bd4343' ],
      data: [ 39, 37, 30 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var deployOnDemandData = {
    labels: [
      'DevOps practitioners',
      'Agile practitioners'
    ],
    datasets: [ {
      backgroundColor: [ '#fa7035', '#e04733' ],
      data: [ 45, 39 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var sdlHighPriorityData = {
    labels: [
      'DevOps practitioners',
      'Agile practitioners'
    ],
    datasets: [ {
      backgroundColor: [ '#fa7035', '#e04733' ],
      data: [ 71, 60 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var devTeamWorkData = {
    labels: [
      'most work at an office',
      'all work at an office',
      'all work remotely',
      'most work remotely'
    ],
    datasets: [ {
      backgroundColor: [ '#FBA438', '#F48727', '#FA7035', '#E85929' ],
      data: [ 48, 31, 11, 10 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var trackTimeRemoteData = {
    labels: [ 'Don\'t track', 'App or program', 'Estimate hours' ],
    datasets: [ {
      backgroundColor: [ '#55448D', '#784475', '#A24356' ],
      data: [ 54, 22, 18 ],
      formatter: percentFormatter
    } ]
  };

  var biggestChallengesData = {
    labels: [
      'Replacing ingrained practices',
      'Resistance to change',
      'Cross-team communication',
      'Inadequate workforce training',
      'Lack of leadership support',
      'Risk-averse culture'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876' ],
      data: [ 58, 50, 36, 27, 26, 21 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var testingMethodologyData = {
    labels: [
      'Agile',
      'DevOps',
      'Waterfall',
      'Conversational Development',
      'Rapid application development'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688' ],
      data: [ 69, 23, 16, 12, 9 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var challengesToWorkData = {
    labels: [
      'Unclear direction',
      'Rework or unplanned work',
      'Unrealistic deadlines'
    ],
    datasets: [ {
      backgroundColor: [ '#FBA438', '#F48727', '#FA7035' ],
      data: [ 67, 54, 31 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var mostDelaysData = {
    labels: [
      'Testing',
      'Planning',
      'Deploying to production',
      'Code reviews',
      'Code development',
      'Monitoring',
      'Test data management'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876' ],
      data: [ 52, 47, 31, 30, 27, 25, 20 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var ciUsageData = {
    labels: [
      'Excellent',
      'Very Good',
      'Good',
      'Not Good',
      'Bad'
    ],
    datasets: [ {
      backgroundColor: [ '#794577', '#a34457', '#c04344', '#e24833', '#f36f39' ],
      data: [ 13, 20, 30, 24, 14 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var deployCodeFrequencyDevopsData = {
    labels: [
      'On demand (multiple times per day)',
      'Between once per day and once per month',
      'Between once per month and once every 6 months'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957' ],
      data: [ 45, 41, 9 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var deployCodeFrequencyAgileData = {
    labels: [
      'On demand (multiple times per day)',
      'Between once per day and once per month',
      'Between once per month and once every 6 months'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957' ],
      data: [ 39, 42, 11 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var deployCodeFrequencyDevelopersData = {
    labels: [
      'On demand (multiple times per day)',
      'Between once per day and once per month',
      'Between once per month and once every 6 months'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957' ],
      data: [ 39, 40, 14 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var deployCodeFrequencyManagementData = {
    labels: [
      'On demand (multiple times per day)',
      'Between once per day and once per month',
      'Between once per month and once every 6 months'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957' ],
      data: [ 47, 38, 12 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var technologySupportInvestmentsData = {
    labels: [
      'Selecting the right technology',
      'Integration with other tools in our stack',
      'Insufficient or poor internal processes',
      'Adoption of new tools',
      'Implementation',
      'Employees don’t have the right skills',
      'Training and support',
      'Lacking key functionality'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876', '#382876' ],
      data: [ 39, 37, 30, 29, 26, 26, 25, 11 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var industryData = {
    labels: [
      'Media and Entertainment',
      'Education',
      'Business services / Consulting',
      'Banking / Financial Services',
      'Healthcare',
      'Retail',
      'Telecommunications'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876', '#382876' ],
      data: [ 7.42, 7.16, 7.12, 5.46, 3.8, 3.17, 3 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var workForSmbData = {
    labels: [
      '1-9 ',
      '10-99 ',
      '100-999',
      '1,000-9,999',
      '10,000+'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876', '#382876' ],
      data: [ 39.92, 34.71, 16.33, 5.97, 3.08 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var identifySoftwareDeveloperData = {
    labels: [
      'Software architect',
      'Other',
      'Technology executive (CIO/CTO/ VP Engineering)',
      'Software development management',
      'Systems / Network engineer',
      'DevOps management',
      'Professional services/Consultant'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876', '#382876' ],
      data: [ 7.18, 7.07, 5.66, 4.41, 3.29, 3.18, 2.21 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var identifyWebDeveloperData = {
    labels: [
      'Other',
      'Desktop applications developer',
      'Mobile developer',
      'DevOps specialist',
      'Embedded applications/devices developer',
      'Developer with statistics or mathematics background',
      'Systems administrator'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876', '#382876' ],
      data: [ 8.85, 6.69, 6.44, 4.47, 3.46, 2.82, 1.14 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var ageData = {
    labels: [
      '25-29',
      '30-34',
      '35-39',
      '20-24',
      '40-50',
      '<20'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876', '#382876' ],
      data: [ 26.28, 25, 16.43, 15.84, 10.95, 2.96 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  var genderData = {
    labels: [
      'male',
      'female'
    ],
    datasets: [ {
      backgroundColor: [ '#ce523e', '#ae4b47', '#964957', '#704772', '#524688', '#382876', '#382876', '#382876' ],
      data: [ 71.87, 24.94 ],
      showLabel: true,
      formatter: percentFormatter
    } ]
  };

  function buildANDData(agreeData, neutralData, disagreeData) {
    return {
      datasets: [
        {
          label: 'Agree',
          backgroundColor: '#FBA438',
          stack: true,
          data: [ agreeData ],
          dataPosition: 'center',
          formatter: percentFormatter
        },
        {
          label: 'Neutral',
          backgroundColor: '#FA7035',
          stack: true,
          data: [ neutralData ],
          dataPosition: 'center',
          formatter: percentFormatter
        },
        {
          label: 'Disagree',
          backgroundColor: '#E04733',
          stack: true,
          data: [ disagreeData ],
          dataPosition: 'center',
          formatter: percentFormatter
        }
      ]
    };
  }

  function buildHtmlLegend(chart) {
    var text = [ '<ul class="clearfix">' ];
    for ( var i = 0; i < chart.data.datasets.length; i++ ) {
      text.push('<li>');
      text.push('<span class="key" style="background-color:' + chart.data.datasets[i].backgroundColor + '"></span> <span class="label">' + chart.data.datasets[i].label + '</span>');
      text.push('</li>');
    }
    text.push('</ul>');
    return text.join('');
  }

  var stackedHorizBarOptions = {
    animation: {
      duration: 0
    },
    plugins: {
      deferred: false,
      baseline: false
    },
    legend: {
      display: false
    },
    cornerRadius: 3,
    stacked: true, // Hook for roundedBarChart plugin
    legendCallback: buildHtmlLegend,
    layout: {
      padding: {
        right: 0
      }
    },
    responsive: true,
    scales: {
      yAxes: [
        {
          display: false
        }
      ],
      xAxes: [
        {
          display: false,
          ticks: {
            beginAtZero: true
          }
        }
      ]
    }
  };

  var deferred = {
    yOffset: '80%'
  };

  if (navigator.userAgent.indexOf('MSIE') !== -1
    || navigator.appVersion.indexOf('Trident/') > 0) {
    deferred = false;
  }
  var horizontalBarChartDefaultOptions = {
    animation: {
      duration: 2000
    },
    plugins: {
      deferred: deferred
    },
    cornerRadius: 3,
    responsive: true,
    legend: false,
    layout: {
      padding: {
        left: 0,
        right: 220,
        top: 0,
        bottom: 0
      }
    },
    scales: {
      yAxes: [
        {
          display: false,
          ticks: {
            beginAtZero: true
          }
        }
      ],
      xAxes: [
        {
          gridLines: {
            display: false
          },
          categoryPercentage: 0.8,
          display: false,
          ticks: {
            beginAtZero: true
          }
        }
      ]
    }
  };

  function top3ChallengesChart() {
    var ctx = document.getElementById('chart-top-3-challenges').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 340
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: top3ChallengesData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function deployOnDemandChart() {
    var ctx = document.getElementById('chart-deploy-on-demand').getContext('2d');
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: deployOnDemandData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function sdlHighPriorityChart() {
    var ctx = document.getElementById('chart-sdl-high-priority').getContext('2d');
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: sdlHighPriorityData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function devTeamWorksChart() {
    var devTeamWorkCtx = document.getElementById('chart-dev-team-work').getContext('2d');
    return new Chart(devTeamWorkCtx, {
      type: 'horizontalBar',
      data: devTeamWorkData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function trackTimeRemoteChart() {
    var ctx = document.getElementById('chart-track-time-remote').getContext('2d');
    return new Chart(ctx, {
      type: 'bar',
      data: trackTimeRemoteData,
      options: {
        cornerRadius: 3,
        animation: {
          duration: 2000
        },
        plugins: {
          deferred: deferred
        },
        responsive: false,
        layout: {
          padding: {
            left: 0,
            right: 0,
            top: 0,
            bottom: 0
          }
        },
        scales: {
          yAxes: [
            {
              display: false,
              ticks: {
                beginAtZero: true
              }
            }
          ],
          xAxes: [
            {
              gridLines: {
                display: false
              },
              categoryPercentage: 1,
              ticks: {
                autoSkip: false,
                maxRotation: 45,
                minRotation: 45,
                fontColor: '#444',
                fontFamily: "'Source Sans Pro', sans-serif",
                fontSize: 18,
                fontStyle: 600
              }
            }
          ]
        },
        legend: {
          display: false
        }
      }
    });
  }

  function biggestChallengesChart() {
    var ctx = document.getElementById('chart-biggest-challenges').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 280
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: biggestChallengesData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function testingMethodologyChart() {
    var ctx = document.getElementById('chart-testing-methodology').getContext('2d');
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: testingMethodologyData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function challengesToWorkChart() {
    var ctx = document.getElementById('chart-challenges-to-work').getContext('2d');
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: challengesToWorkData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function mostDelaysChart() {
    var ctx = document.getElementById('chart-most-delays').getContext('2d');
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: mostDelaysData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function ciUsageChart() {
    var ctx = document.getElementById('chart-ci-usage').getContext('2d');
    return new Chart(ctx, {
      type: 'doughnut',
      data: ciUsageData,
      options: {
        animation: {
          duration: 2000
        },
        plugins: {
          deferred: deferred
        },
        cutoutPercentage: 33,
        responsive: false,
        layout: {
          padding: {
            left: 0,
            right: 0,
            top: 0,
            bottom: 0
          }
        },
        scales: {
          yAxes: [
            {
              display: false,
              ticks: {
                beginAtZero: true
              }
            }
          ],
          xAxes: [
            {
              display: false
            }
          ]
        },
        legend: {
          display: false
        }
      }
    });
  }


  function deployCodeFrequencyDevopsChart() {
    var ctx = document.getElementById('chart-deploy-code-frequency-devops').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 360
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: deployCodeFrequencyDevopsData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function deployCodeFrequencyAgileChart() {
    var ctx = document.getElementById('chart-deploy-code-frequency-agile').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 370
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: deployCodeFrequencyAgileData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function deployCodeFrequencyDevelopersChart() {
    var ctx = document.getElementById('chart-deploy-code-frequency-developers').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 420
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: deployCodeFrequencyDevelopersData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function deployCodeFrequencyManagementChart() {
    var ctx = document.getElementById('chart-deploy-code-frequency-management').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 320
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: deployCodeFrequencyManagementData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function technologySupportInvestmentsChart() {
    var ctx = document.getElementById('chart-technology-support-investments').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 360
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: technologySupportInvestmentsData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function industryChart() {
    var ctx = document.getElementById('chart-industry').getContext('2d');
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: industryData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function workForSmbChart() {
    var ctx = document.getElementById('chart-work-for-smb').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 50
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: workForSmbData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function identifySoftwareDeveloperChart() {
    var ctx = document.getElementById('chart-identify-software-developer').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 380
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: identifySoftwareDeveloperData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function identifyWebDeveloperChart() {
    var ctx = document.getElementById('chart-identify-web-developer').getContext('2d');
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: identifyWebDeveloperData,
      options: horizontalBarChartDefaultOptions
    });
  }

  function ageChart() {
    var ctx = document.getElementById('chart-age').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 0
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: ageData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function genderChart() {
    var ctx = document.getElementById('chart-gender').getContext('2d');
    var customOptions = {
      layout: {
        padding: {
          right: 80
        }
      }
    };
    return new Chart(ctx, {
      type: 'horizontalBar',
      data: genderData,
      options: deepmerge(horizontalBarChartDefaultOptions, customOptions)
    });
  }

  function buildStackedHorizBarChart(key, data) {
    var ctx = document.getElementById('chart-' + key).getContext('2d');
    var chart = new Chart(ctx, {
      type: 'horizontalBar',
      data: data,
      options: stackedHorizBarOptions
    });
    document.getElementById('legend-' + key).innerHTML = chart.generateLegend();
  }

  top3ChallengesChart();
  deployOnDemandChart();
  sdlHighPriorityChart();

  var sektorOptions = {
    size: 196,
    stroke: 8,
    arc: true,
    angle: 0,
    fillCircle: false
  };

  function buildCircleStat(selector, color, percent) {
    var sektorContainer = $(selector).get(0);
    var sektor = new Sektor(selector, deepmerge(sektorOptions, {
      sectorColor: color
    }));

    var sektorCallback = function() {
      if ( verge.inY(sektorContainer, -300) ) {
        sektor.animateTo(360 * percent, 1000);
        window.an_OnScroll.removeFunction(sektorCallback);
      }
    };
    window.an_OnScroll.addFunction(sektorCallback);
  }

  buildCircleStat('.remote-teams-visibility', '#fba438', 0.67);
  buildCircleStat('.in-office-ingrained-practices', '#fa7035', 0.6);
  buildCircleStat('.remote-teams-devops-culture', '#e85929', 0.41);
  buildCircleStat('.in-office-devops-culture', '#bd4343', 0.4);

  devTeamWorksChart();
  trackTimeRemoteChart();
  biggestChallengesChart();

  // In-office vs remote
  buildStackedHorizBarChart('visibility-other-teams', buildANDData(56, 17, 27));
  buildStackedHorizBarChart('visibility-other-teams-remote', buildANDData(67, 16, 17));
  buildStackedHorizBarChart('collaborative-environment', buildANDData(95, 4, 1));
  buildStackedHorizBarChart('collaborative-environment-remote', buildANDData(91, 7, 2));
  buildStackedHorizBarChart('new-practices', buildANDData(82, 9, 9));
  buildStackedHorizBarChart('new-practices-remote', buildANDData(84, 8, 8));
  buildStackedHorizBarChart('collaborate', buildANDData(81, 9, 10));
  buildStackedHorizBarChart('collaborate-remote', buildANDData(83, 9, 8));
  buildStackedHorizBarChart('expectations-requirements', buildANDData(48, 20, 32));
  buildStackedHorizBarChart('expectations-requirements-remote', buildANDData(65, 16, 19));
  buildStackedHorizBarChart('ideas-valued', buildANDData(83, 10, 7));
  buildStackedHorizBarChart('ideas-valued-remote', buildANDData(88, 7, 5));

  // Lower Performing vs Higher Performing
  buildStackedHorizBarChart('setup-to-succeed', buildANDData(69, 17, 14));
  buildStackedHorizBarChart('setup-to-succeed-hp', buildANDData(78, 14, 8));
  buildStackedHorizBarChart('realistic-deadlines', buildANDData(57, 17, 26));
  buildStackedHorizBarChart('realistic-deadlines-hp', buildANDData(70, 13, 17));
  buildStackedHorizBarChart('sacrifice-quality', buildANDData(42, 18, 40));
  buildStackedHorizBarChart('sacrifice-quality-hp', buildANDData(55, 15, 30));

  testingMethodologyChart();
  challengesToWorkChart();
  mostDelaysChart();
  ciUsageChart();

  // Lower Performing vs Higher Performing - Workflow
  buildStackedHorizBarChart('ci-alleviates-blockers', buildANDData(87, 12, 1));
  buildStackedHorizBarChart('ci-alleviates-blockers-hp', buildANDData(86, 12, 2));
  buildStackedHorizBarChart('automate-lifecycle-tasks', buildANDData(48, 19, 33));
  buildStackedHorizBarChart('automate-lifecycle-tasks-hp', buildANDData(60, 19, 21));
  buildStackedHorizBarChart('deployment-process-insight', buildANDData(45, 22, 33));
  buildStackedHorizBarChart('deployment-process-insight-hp', buildANDData(69, 15, 16));
  buildStackedHorizBarChart('change-affects-performance', buildANDData(42, 20, 38));
  buildStackedHorizBarChart('change-affects-performance-hp', buildANDData(61, 16, 23));
  buildStackedHorizBarChart('monitoring-tools', buildANDData(42, 21, 37));
  buildStackedHorizBarChart('monitoring-tools-hp', buildANDData(62, 15, 23));
  buildStackedHorizBarChart('production-like-env', buildANDData(39, 17, 44));
  buildStackedHorizBarChart('production-like-env-hp', buildANDData(62, 13, 25));

  // Code Deploy Frequency
  deployCodeFrequencyDevopsChart();
  deployCodeFrequencyAgileChart();
  deployCodeFrequencyDevelopersChart();
  deployCodeFrequencyManagementChart();

  technologySupportInvestmentsChart();

  // Developers vs Managers - Tools
  buildStackedHorizBarChart('open-source-important', buildANDData(53, 31, 16));
  buildStackedHorizBarChart('open-source-important-managers', buildANDData(72, 21, 7));
  buildStackedHorizBarChart('open-source-secure', buildANDData(58, 35, 7));
  buildStackedHorizBarChart('open-source-secure-managers', buildANDData(68, 27, 5));
  buildStackedHorizBarChart('open-source-streamlines', buildANDData(58, 34, 8));
  buildStackedHorizBarChart('open-source-streamlines-managers', buildANDData(68, 26, 6));

  // Lower Performing vs Higher Performing - Tools
  buildStackedHorizBarChart('access-to-best-tools', buildANDData(63, 18, 19));
  buildStackedHorizBarChart('access-to-best-tools-managers', buildANDData(83, 11, 6));
  buildStackedHorizBarChart('lose-time-context-switch', buildANDData(62, 21, 17));
  buildStackedHorizBarChart('lose-time-context-switch-managers', buildANDData(49, 23, 28));

  // Demographics
  industryChart();
  workForSmbChart();
  identifySoftwareDeveloperChart();
  identifyWebDeveloperChart();
  ageChart();
  genderChart();
}(jQuery));
