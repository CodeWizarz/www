 (function ($, root, undefined) {

  	$(function () {

  		'use strict';

      $.ajax({
        type: 'GET',
        dataType: 'jsonp',
        cache: false,
        url: "https://boards-api.greenhouse.io/v1/boards/gitlab/departments",
        success: function(data) {
        console.log(data);
        // grab all the departments
        data.departments.forEach((dept, i) => {
          // check for jobs per department
          var hasJobs = data.departments[i].jobs.length;
          if ( hasJobs > 0 ) {
            // get the unique ID per dept
            var jobBucket = data.departments[i].id;
            // grab open jobs
            // Sales - all sales
            if( jobBucket == "4043191002" || jobBucket == "4011070002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-sales__all').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Sales - commercial sales
            if( jobBucket == "4021651002" || jobBucket == "4038369002" || jobBucket == "4038368002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-sales__comm').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Sales - customer success
            if( jobBucket == "4011043002" || jobBucket == "4011050002" || jobBucket == "4016437002" || jobBucket == "4054959002" || jobBucket == "4011051002" || jobBucket == "4011052002" || jobBucket == "4052737002" || jobBucket == "4052738002" || jobBucket == "4052739002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-sales__customer').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Sales - enterprise
            if( jobBucket == "4021650002" || jobBucket == "4035463002" || jobBucket == "4035462002" || jobBucket == "4035464002" || jobBucket == "4035461002" || jobBucket == "4035460002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-sales__enterprise').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Sales - field
            if( jobBucket == "4021652002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-sales__field').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - brand
            if( jobBucket == "4054429002" || jobBucket == "4054451002" || jobBucket == "4054429002" || jobBucket == "4070018002" || jobBucket == "4070020002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__brand').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - campaigns
            if( jobBucket == "4054419002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__campaigns').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - comm
            if( jobBucket == "4054421002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__comm').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - relations
            if( jobBucket == "4043189002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__relations').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - content
            if( jobBucket == "4054427002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__content').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - digital
            if( jobBucket == "4011058002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__digital').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - digital exp
            if( jobBucket == "4049468002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__digital__exp').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - field
            if( jobBucket == "4011056002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__field').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Marketing - product
            if( jobBucket == "4011061002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__product').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
              // Marketing - other
            if( jobBucket == "4011045002" || jobBucket == "4059677002" || jobBucket == "4021654002" || jobBucket == "4054424002" || jobBucket == "4054420002" || jobBucket == "4011059002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-marketing__all').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Product - product mgmt
            if( jobBucket == "4011048002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-product__mgmt').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Product - ux
            if( jobBucket == "4021657002" || jobBucket == "4011067002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__ux').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Engineering - development
            if( jobBucket == "4034706002" || jobBucket == "4034706002" || jobBucket == "4034710002" || jobBucket == "4034709002" || jobBucket == "4034712002" || jobBucket == "4056810002" || jobBucket == "4034711002" || jobBucket == "4034707002" || jobBucket == "4034708002" || jobBucket == "4021655002" || jobBucket == "4034707002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__development').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Engineering - support
            if( jobBucket == "4011053002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__support').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Engineering - incubation
            if( jobBucket == "4061741002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__incubation').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Engineering - infrastructure
            if( jobBucket == "4016843002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__infrastructure').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Engineering - quality
            if( jobBucket == "4021656002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__quality').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });  
            }
            
            // Engineering - modelops
            if( jobBucket == "4075033002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__modelops').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // Security - all-security
            if( jobBucket == "4011054002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-engineering__security').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // General - finance
            if( jobBucket == "4011063002" || jobBucket == "4043187002" || jobBucket == "4070572002") {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-general_finance').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // General - business
            if( jobBucket == "4011062002" || jobBucket == "4069213002" || jobBucket == "4069214002" || jobBucket == "4069216002" || jobBucket == "4069215002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-general_business').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // General - strategy
            if( jobBucket == "4033533002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-general_strategy').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // General - legal
            if( jobBucket == "4043188002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-general_legal').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // General - people
            if( jobBucket == "4063692002" || jobBucket == "4013092002" || jobBucket == "4070223002" || jobBucket == "4068823002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-general_people').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }
            // General - talent
            if( jobBucket == "4011065002" ) {
              data.departments[i].jobs.forEach((job, j) => {
                $('#jobs-desc-general_talent').append('<li data-locale="' + data.departments[i].jobs[j].location.name + '"><a href="' + data.departments[i].jobs[j].absolute_url + '" title="' + data.departments[i].jobs[j].title + ' job at GitLab" target="_blank" rel="noopener noreferrer">' + data.departments[i].jobs[j].title + '<br/><em>' + data.departments[i].jobs[j].location.name + '</em></a></li>');
              });
            }

          }

        });
        return false;
        }
      });

      // show default message if no jobs
      $(window).on('load', function() {
        $('.accordion ul.job--list').each( function() {
          // var totalJerbs = $(this).find('li').length;
          // console.log(totalJerbs);
          if( $(this).find('li').length === 0 ) {
            $(this).remove('is--empty');
            $(this).append('<li class="is--empty mb-4">Sorry, no current openings.</li>')
          } else {
            $(this).remove('is--empty');
          }
        });
      });

      // open/close job buckets
      $('#content button.accordion-button').on('click', function(e) {
        // get some vars
        var bucketTarget = $(this).data('bs-target');
        $(this).toggleClass('collapsed');
        $(bucketTarget).toggleClass('show');
      });

      // deep link the select options
      $('#jump--links').on('change', function() {

        // collapse all buckets
        $('.accordion-collapse').removeClass('show');
        // get the value and target
        var url = $(this).val();
        var target = $('#jump--links').find(":selected").attr('data-bucket');
        var scroll = $('#jump--links').find(":selected").attr('data-scrollto');
        var btnTar = $('button.accordion-button[data-bs-target="' + target + '"]');
        // require the url
        if (url) {
          window.location = url;
          function openBucket() {
            $(btnTar).removeClass('collapsed');
            $(target).addClass('show');
          }
          setTimeout(openBucket, 500);
        }
        return false;
      });

      // filter by location
      $('#filter--links').on('change', function() {
        // grab the selected option
        var filter = $(this).find(":selected").val();

        if( filter == 'All') {
          $('.accordion ul.job--list li.is--empty').remove();
          $('.accordion ul.job--list li').each( function() {
            $(this).show();
          });
        } else {
          // filter the list
          $('.accordion ul.job--list li').each( function() {
            if( $(this).attr('data-locale') == filter ) {
              $(this).show();
            } else {
              $(this).hide();
            }
          });
          // show default message if no jobs
          $('.accordion ul.job--list').each( function() {
            if( $(this).find('li:visible').length < 1 ) {
              $(this).remove('is--empty');
              $(this).append('<li class="is--empty">Sorry, no <b>' + filter + '</b> openings.</li>')
            } else {
              $(this).remove('is--empty');
            }
          });
        }
      });

      // get all openings for search
      $.ajax({
        type: 'GET',
        dataType: 'jsonp',
        cache: false,
        url: "https://boards-api.greenhouse.io/v1/boards/gitlab/jobs",
        success: function(jobs) {
        console.log(jobs);
          // grab all the jobs
          jobs.jobs.forEach((opening, i) => {
            $('#openings').append('<li class="opening"><a href="' + jobs.jobs[i].absolute_url + '" target="_blank"><span class="title">' + jobs.jobs[i].title + '</span><br><em>' + jobs.jobs[i].location.name + '</em></a></li>');
          });
          // hide em
          $('#openings li').hide();
        return false;
        }
      });

      // search openings
      $('#job--search').keyup(function(){
        // Search text
        var text = $(this).val().toLowerCase();
        // Hide all content class element
        $('#openings').hide();
        $('#openings li').hide();
        // Search
        $('#openings li .title').each(function(){
          if($(this).text().toLowerCase().indexOf(""+text+"") != -1 ){
            $('#openings').show();
            $(this).closest('li.opening').show();
          }
        });
        // reset when empty
        if( $(this).val().length === 0 ) {
          $('#openings').hide();
          $('#openings li').hide();
        }
      });

    });
  })(jQuery, this);
  
