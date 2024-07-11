require 'open-uri'
require 'nokogiri'
require 'cgi'
require 'openssl'
require 'rest-client'

module CustomHelpers
  THOUSANDS_REGEXP = /(.*\d)(\d{3})/.freeze

  def salary_avail
    data.people_group.job_families.sort_by(&:title)
  end

  def current_role_for_salary_calculator
    current_role = salary_avail.detect do |role|
      descriptions = role.description.is_a?(String) ? role.description.split : role.description

      descriptions.detect do |description|
        description.start_with?("/#{File.dirname(current_page.request_path)}")
      end
    end

    current_role&.title
  end

  def no_hiring_countries
    response = RestClient.get('https://comp-calculator.gitlab.net/api//hiring_status/list_no_hiring')
    JSON.parse(response.body).dig('countries')
  rescue RestClient::NotFound, Errno::ECONNREFUSED, RestClient::Exception, OpenSSL::SSL::SSLError
    []
  end

  def current_role_sales?
    url = current_page.request_path
    url.include?('job-families/sales/')
  end

  def icon(icon, cssclass = "", attrs = {})
    width = attrs[:width] || 76
    height = attrs[:height] || 76
    viewbox_width = attrs[:viewbox_width] || width
    viewbox_height = attrs[:viewbox_height] || height
    label = attrs[:label] || ""
    content_tag :svg, viewbox: "0 0 #{viewbox_width} #{viewbox_height}", width: width, height: height, class: cssclass, aria: { label: label }, role: "img" do
      partial "includes/icons/#{icon}.svg"
    end
  end

  def svg_image(icon, cssclass = "", attrs = {})
    data = attrs[:data] || ""
    content_tag :svg, class: cssclass, role: "img", data: data do
      partial icon
    end
  end

  def xml_feed_content(article)
    content = article.body

    content << if article.data.image_title
                 "<img src='#{data.site.url}#{article.data.image_title}' class='webfeedsFeaturedVisual' style='display: none;' />"
               else
                 "<img src='#{data.site.url}#{image_path('default-blog-image.png')}' class='webfeedsFeaturedVisual' style='display: none;' />"
               end

    h(content)
  end

  def markdown(text)
    # Scope parameter is necessary to make Markdown in YAML work properly
    # See: https://github.com/middleman/middleman/issues/653#issuecomment-9954111
    Tilt['markdown'].new { text }.render(scope: self)
  end

  def kramdown(text)
    Kramdown::Document.new(text).to_html
  end

  def add_thousands_separators(number)
    number = number.to_s
    number = number.sub(THOUSANDS_REGEXP, '\1,\2') while number.match?(THOUSANDS_REGEXP)
    number
  end

  def team_size
    Gitlab::Homepage
      .team
      .members
      .count(&:person?)
      .then { |number| add_thousands_separators(number) }
  end

  def open_roles
    data.roles.select(&:open).sort_by(&:title)
  end

  def kpi_list_by_org(org)
    kpis = fetch_performance_indicators_for_org(org).select { |pi| pi.is_key == true }

    partial('includes/performance_indicator_list.erb', locals: { kpis: kpis })
  end

  def color_code_grades(grade)
    color = "green"  if grade.include? 'A'
    color = "green"  if grade.include? 'B'
    color = "orange" if grade.include? 'C'
    color = "red"    if grade.include? 'D'
    color = "red"    if grade.include? 'F'

    "<span style='color:#{color};'>#{grade}</span>"
  end

  def color_code_health(level)
    case level
    when 3
      color = "green"
      text = "Okay"
    when 2
      color = "orange"
      text = "Attention"
    when 1
      color = "red"
      text = "Problem"
    when -1
      color = "purple"
      text = "Confidential"
    else
      color = "gray"
      text = "Unknown"
    end

    "<span style='border-radius:0.2em; font-weight:bold; padding-left:1em; padding-right:1em; color:white; background-color:#{color};'>#{text}</span>"
  end

  def color_code_instrumentation(level)
    case level
    when 3
      color = "green"
      text = "Okay"
    when 2
      color = "orange"
      text = "Attention"
    when 1
      color = "red"
      text = "Problem"
    else
      color = "gray"
      text = "Unknown"
    end

    "<span style='border-radius:0.2em; font-weight:bold; padding-left:1em; padding-right:1em; color:white; background-color:#{color};'>#{text}</span>"
  end

  def key_performance_indicators(orgs)
    kpis = orgs.map { |org| fetch_performance_indicators_for_org(org) }.flatten

    kpis
      .select(&:is_key?)
      .sort_by { |pi| pi.health.level }
      .sort_by { |pi| orgs.index pi.org }
  end

  def performance_indicators_by_maturity_level
    data
      .performance_indicators
      .values
      .flatten
      .sort_by { |pi| pi_maturity_level(pi) }
  end

  def pi_maturity_level(performance_indicator)
    level = 0

    level += 1 if performance_indicator.definition
    level += 1 if performance_indicator.target
    if performance_indicator.public == false && performance_indicator.urls
      level += 1
    elsif performance_indicator.sisense_data
      level += 1
    end

    level
  end

  def pi_maturity_reasons(performance_indicator)
    reasons = []

    reasons.push("Needs a definition") unless performance_indicator.definition
    reasons.push("Needs a target") unless performance_indicator.target
    if performance_indicator.public == false && !performance_indicator.urls
      reasons.push("Needs a url")
    elsif performance_indicator.public == true && !performance_indicator.sisense_data
      reasons.push("Needs Sisense Embed Info")
    end

    reasons
  end

  def color_code_maturity(level)
    color = case level
            when 3
              "green"
            when 2
              "orange"
            when 1
              "red"
            else
              "gray"
            end

    "<span style='border-radius:0.2em; font-weight:bold; padding-left:1em; padding-right:1em; color:white; background-color:#{color};'>Level #{level} of 3</span>"
  end

  def performance_indicators_stage_and_group
    smau_pis = []
    gmau_pis = []
    other_stage_pis = []
    other_group_pis = []

    ["Dev Section", "Enablement Section", "Ops Section", "Sec Section"].each do |section|
      fetch_performance_indicators_for_org(section).each do |pi|
        next unless pi.pi_type.present?

        smau_pis.push(pi) if pi.pi_type.include? 'SMAU'
        gmau_pis.push(pi) if pi.pi_type.include? 'GMAU'
        if pi.pi_type.include? 'SMAC'
          other_stage_pis.push(pi)
        elsif pi.pi_type.include? 'Stage PPI'
          other_stage_pis.push(pi)
        end
        if pi.pi_type.include? 'GMAC'
          other_group_pis.push(pi)
        elsif pi.pi_type.include? 'Group PPI'
          other_group_pis.push(pi)
        end
      end
    end

    partial('includes/performance_indicators_stage_and_group.html.erb', locals: { smau_pis: smau_pis, gmau_pis: gmau_pis, other_stage_pis: other_stage_pis, other_group_pis: other_group_pis })
  end

  def performance_indicators(org)
    kpis = []
    rpis = []

    fetch_performance_indicators_for_org(org).each do |pi|
      if pi.is_key == true
        kpis.push(pi)
      else
        rpis.push(pi)
      end
    end

    partial('includes/performance_indicators.html.erb',
      locals: {
        org: org,
        key_performance_indicators: kpis,
        regular_performance_indicators: rpis
      }
    )
  end

  def fetch_performance_indicators_for_org(org)
    key = org.tr(' ', '_').downcase

    data.performance_indicators.fetch(key, [])
  end

  def availability_performance_indicator
    performance_indicators = fetch_performance_indicators_for_org('Infrastructure Department')

    performance_indicators.select do |pi|
      pi['name'] == 'GitLab.com Availability'
    end.first
  end

  def mttp_performance_indicator
    performance_indicators = fetch_performance_indicators_for_org('Infrastructure Department')

    performance_indicators.select do |pi|
      pi['name'] == 'Mean Time To Production (MTTP)'
    end.first
  end

  def signed_periscope_url(data)
    # Forks may not have the API key, so just return a placeholder URL
    return 'https://about.gitlab.com/images/press/logo/preview/gitlab-logo-white-preview.png' unless ENV['PERISCOPE_EMBED_API_KEY']

    path = '/api/embedded_dashboard?data=' + CGI.escape(data.to_json)
    signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['PERISCOPE_EMBED_API_KEY'], path)

    'https://www.periscopedata.com' + path + '&signature=' + signature
  end

  def font_url(current_page)
    fonts = ["Source+Sans+Pro:200,300,400,500,600,700"]

    if current_page.data.extra_font
      fonts = fonts.concat current_page.data.extra_font
    end
    fonts = fonts.join("|")

    "//fonts.googleapis.com/css?family=#{fonts}"
  end

  def highlight_active_nav_link(link_text, url, options = {})
    options[:class] ||= ""
    options[:class] << " active" if url == current_page.url
    link_to(link_text, url, options)
  end

  def full_url(current_page)
    "#{data.site.url}#{current_page.url}"
  end

  def current_version
    ReleaseList.new.release_posts.first.version
  end

  def copy_btn_options(copy_text, tooltip_text = nil, button_class = nil)
    tooltip_text = 'Copy to clipboard' if tooltip_text.nil?
    button_class = 'copy-btn js-copy-btn' if button_class.nil?

    {
      class: "btn #{button_class}", type: 'button',
      title: tooltip_text, 'aria-label' => tooltip_text,
      data: {
        'clipboard-text' => copy_text,
        toggle: 'tooltip', placement: 'top'
      }
    }
  end

  def ci_environment?
    !!ENV['CI_SERVER']
  end

  def production_environment?
    ENV['CI_COMMIT_REF_NAME'] == 'master'
  end

  def add_extra_css(*files)
    current_page.data.extra_css ||= []
    current_page.data.extra_css |= files
  end

  def add_extra_js(*files)
    current_page.data.extra_js ||= []
    current_page.data.extra_js |= files
  end

  def heroes_size
    data.heroes.count { |entry| entry['type'] == 'person' }
  end

  def heroes_alumni_size
    data.heroes_alumni.count { |entry| entry['type'] == 'person' }
  end

  def handbook_product_page?(relative_path)
    relative_path.to_s.include? 'handbook/product/'
  end

  def web_ide_url(site, monorepo_site_path_fragment, relative_path)
    "#{site.instance}-/ide/project/#{site.path}edit/master/-/#{monorepo_site_path_fragment}source/#{relative_path}"
  end

  def blob_editor_url(site, monorepo_site_path_fragment, relative_path)
    "#{site.repo}blob/master/#{monorepo_site_path_fragment}source/#{relative_path}"
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/CyclomaticComplexity
  def devops_diagram(stages)
    diagram = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1025 500" role="img" aria-label="GitLab DevSecOps Lifecycle">
      <style>
      .text {
        font-family: Inter,Source Sans Pro,sans-serif;
        font-size: 20px;
        font-weight: bold;
        fill: #2b2838;
        letter-spacing: .02em;
        dominant-baseline: middle;
        text-anchor: middle;
      }
      .text2 {
        font-size: 26px;
        fill: #2b2838;
      }
      .devsecops {
        font-size: 56px;
        fill: black;
      }
      .mix {
        mix-blend-mode: color-burn;
      }
      .line {
        fill: none;
        stroke: #2b2838;
        stroke-width: 2px;
      }
      .highlighted {
        font-size: 22px;
      }
      .highlightedline {
        stroke-width: 3px;
      }
      .white_fill {
        fill: #fff;
      }
      .faded {
        fill: #a09fa4;
      }
      .fadestroke {
        stroke: #a09fa4;
      }
      .lightline{
        stroke: #d3d0d4;
        stroke-width: 3px;
      }</style>
      <linearGradient id="linear-gradient" x1="18" y1="250" x2="1007" y2="250" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse">
        <stop offset="0" stop-color="#e6dcf4"/>
        <stop offset="1" stop-color="#ffd0be"/>
      </linearGradient>
      <linearGradient id="linear-gradient-2" x1="720.88" y1="337.91" x2="370.24" y2="74.18" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse">
        <stop offset="0" stop-color="#2b2838" stop-opacity=".24"/>
        <stop offset="1" stop-color="#45424d" stop-opacity="0"/>
      </linearGradient>
      <linearGradient id="linear-gradient-3" x1="304.12" y1="162.09" x2="654.76" y2="425.82" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse">
        <stop offset="0" stop-color="#2b2838" stop-opacity=".24"/>
        <stop offset="1" stop-color="#45424d" stop-opacity="0"/>
      </linearGradient>
      <path id="background" fill="#fff" d="M 0,0 L 1025,0 L 1025,500 L 0,500" />'
    diagram << '<path id="upper_arc" class="line' + (' fadestroke' unless stages.any? { |x| %w[Secure All].include?(x) }).to_s + (' highlightedline' if stages.any? { |x| %w[Secure].include?(x) }).to_s + '" d="M 0,250 a238,238 0 0,1 238,-238 L 787,12 a238,238 0 0,1 238,238" />'
    diagram << '<path id="lower_arc" class="line' + (' fadestroke' unless stages.any? { |x| %w[Govern All].include?(x) }).to_s + (' highlightedline' if stages.any? { |x| %w[Govern].include?(x) }).to_s + '" d="M 0,250 a238,238 0 0,0 238,238 L 787,488 a238,238 0 0,0 238,-238" />'
    diagram << '<path id="clear_1" fill="#fff" d="M -3,190 L -3,310 L 1028,310 L 1028,190" />
      <path id="clear_2" fill="#fff" d="M 422,0 L 603,0 L 603,500 L 422,500" />
      <path id="loop" fill="url(#linear-gradient)" d="M 512.5,181.18 L 370.24,74.18 a220,220 0 1,0 0,351.64 L 512.5,318.8 L 654.76,425.82 a220,220 0 1,0 0,-351.64" />
      <path id="cutout_1" fill="#fff" d="M 421,250 L 304.12,162.09 a110,110 0 1,0 0,175.82" />
      <path id="cutout_2" fill="#fff" d="M 604,250 L 720.88,162.09 a110,110 0 1,1 0,175.82" />
      <path id="shadow_1" fill="url(#linear-gradient-2)" class="mix" d="M 512.5,181.18 L 421,250 L 304.12,162.09 L 370.24,74.18" />
      <path id="shadow_2" fill="url(#linear-gradient-3)" class="mix" d="M 512.5,318.8 L 604,250 L 720.88,337.91 L 654.76,425.82" />'
    diagram << '<path id="deploy_operate" class="line" d="M 898,130 a165,165 0 0,1 0,240" />' if stages.any? { |x| %w[Release].include?(x) } && stages.any? { |x| %w[Configure].include?(x) }
    diagram << '<path id="operate_monitor" class="line" d="M 898,370 a165,165 0 0,1 -210.18,11.86 L 672,370" />' if stages.any? { |x| %w[Configure].include?(x) } && stages.any? { |x| %w[Monitor].include?(x) }
    diagram << '<path id="monitor_plan" class="line" d="M 672,370 L 558.25,284.41 M 466.75,215.59 L 353,130" />' if stages.any? { |x| %w[Monitor].include?(x) } && stages.any? { |x| %w[Plan].include?(x) }
    diagram << '<path id="plan_code" class="line" d="M 353,130 L 337.18,118.135 a165,165 0 0,0 -210.18,11.86" />' if stages.any? { |x| %w[Plan].include?(x) } && stages.any? { |x| %w[Create].include?(x) }
    diagram << '<path id="code_build" class="line" d="M 127,130 a165,165 0 0,0 0,240" />' if stages.any? { |x| %w[Create].include?(x) } && stages.any? { |x| %w[Verify].include?(x) }
    diagram << '<path id="build_test" class="line" d="M 127,370 a165,165 0 0,0 226,0" />' if stages.any? { |x| %w[Verify].include?(x) }
    diagram << '<path id="test_release" class="line" d="M 353,370 L 672,130" />' if stages.any? { |x| %w[Verify].include?(x) } && stages.any? { |x| %w[Package].include?(x) }
    diagram << '<path id="release_deploy" class="line" d="M 672,130 a165,165 0 0,1 226,0" />' if stages.any? { |x| %w[Package].include?(x) } && stages.any? { |x| %w[Release].include?(x) }
    diagram << '<path id="plan_box" fill="#2b2838" d="M 318,115 L 388,115 L 388,131 C 388,138 381,145 374,145 L 318,145Z" />' if stages.any? { |x| %w[Plan].include?(x) }
    diagram << '<path id="code_box" fill="#2b2838" d="M 87,115 L 167,115 L 167,131 C 167,138 160,145 153,145 L 87,145Z" />' if stages.any? { |x| %w[Create].include?(x) }
    diagram << '<path id="build_box" fill="#2b2838" d="M 88,355 L 166,355 L 166,371 C 166,378 159,385 152,385 L 88,385Z" />' if stages.any? { |x| %w[Verify].include?(x) }
    diagram << '<path id="test_box" fill="#2b2838" d="M 317,355 L 389,355 L 389,371 C 389,378 382,385 375,385 L 317,385Z" />' if stages.any? { |x| %w[Verify].include?(x) }
    diagram << '<path id="release_box" fill="#2b2838" d="M 619,115 L 725,115 L 725,131 C 725,138 718,145 711,145 L 619,145Z" />' if stages.any? { |x| %w[Package].include?(x) }
    diagram << '<path id="deploy_box" fill="#2b2838" d="M 850,115 L 946,115 L 946,131 C 946,138 939,145 932,145 L 850,145Z" />' if stages.any? { |x| %w[Release].include?(x) }
    diagram << '<path id="operate_box" fill="#2b2838" d="M 844,355 L 952,355 L 952,371 C 952,378 945,385 938,385 L 844,385Z" />' if stages.any? { |x| %w[Configure].include?(x) }
    diagram << '<path id="monitor_box" fill="#2b2838" d="M 619,355 L 725,355 L 725,371 C 725,378 718,385 711,385 L 619,385Z" />' if stages.any? { |x| %w[Monitor].include?(x) }
    diagram << '<path class="lightline" fill="none" d="M 421,256 L 304.12,168.09 a104,104 0 1,0 -64.12,185.91 L 225,341" />
      <path class="lightline" fill="none" d="M 604,256 L 720.88,168.09 a104,104 0 1,1 64.12,185.91 L 800,341" />
      <path fill="#fff" class="lightline" d="M 357,205 L 668,205 a45,45 0 0,1 0,90 L 357,295 a45,45 0 0,1 0,-90" />
      <path d="M536.514 419L536.448 418.82L529.663 401.124C529.526 400.778 529.281 400.483 528.965 400.283C528.73 400.131 528.461 400.039 528.184 400.01C527.905 399.981 527.624 400.018 527.363 400.118C527.1 400.216 526.866 400.376 526.676 400.583C526.488 400.789 526.35 401.037 526.274 401.306L521.695 415.326H503.151L498.571 401.306C498.495 401.037 498.357 400.79 498.169 400.584C497.979 400.378 497.745 400.219 497.484 400.119C497.221 400.02 496.941 399.982 496.662 400.011C496.384 400.04 496.116 400.133 495.88 400.283C495.565 400.483 495.32 400.778 495.183 401.124L488.403 418.824L488.331 419C487.355 421.551 487.235 424.35 487.989 426.976C488.743 429.601 490.33 431.911 492.511 433.556L492.536 433.575L492.594 433.62L502.914 441.355L508.034 445.224L511.145 447.575C511.51 447.851 511.955 448 512.411 448C512.869 448 513.314 447.851 513.679 447.575L516.789 445.224L521.909 441.355L532.303 433.575L532.331 433.553C534.513 431.909 536.1 429.6 536.854 426.975C537.609 424.35 537.489 421.551 536.514 419Z" fill="#E24329"/>
      <path d="M536.514 419L536.448 418.82C533.141 419.499 530.028 420.899 527.328 422.923L512.431 434.186L521.916 441.355L532.309 433.575L532.339 433.553C534.517 431.908 536.104 429.599 536.858 426.974C537.61 424.349 537.49 421.55 536.514 419Z" fill="#FC6D26"/>
      <path d="M502.914 441.355L508.034 445.224L511.145 447.575C511.51 447.851 511.954 448 512.411 448C512.869 448 513.314 447.851 513.679 447.575L516.789 445.224L521.909 441.355L512.425 434.186L502.914 441.355Z" fill="#FCA326"/>
      <path d="M497.519 422.923C494.82 420.9 491.706 419.5 488.403 418.824L488.331 419C487.355 421.551 487.235 424.35 487.989 426.976C488.743 429.601 490.33 431.911 492.511 433.556L492.536 433.575L492.594 433.62L502.914 441.355L512.405 434.186L497.519 422.923Z" fill="#FC6D26"/>
      <text x="50%" y="255" class="text devsecops">DevSecOps</text>'
    diagram << '<text x="353" y="131" class="text' + (' faded' unless stages.any? { |x| %w[Plan All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Plan].include?(x) }).to_s + '">Plan</text>'
    diagram << '<text x="127" y="131" class="text' + (' faded' unless stages.any? { |x| %w[Create All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Create].include?(x) }).to_s + '">Code</text>'
    diagram << '<text x="127" y="371" class="text' + (' faded' unless stages.any? { |x| %w[Verify All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Verify].include?(x) }).to_s + '">Build</text>'
    diagram << '<text x="353" y="371" class="text' + (' faded' unless stages.any? { |x| %w[Verify All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Verify].include?(x) }).to_s + '">Test</text>'
    diagram << '<text x="672" y="131" class="text' + (' faded' unless stages.any? { |x| %w[Package All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Package].include?(x) }).to_s + '">Release</text>'
    diagram << '<text x="898" y="131" class="text' + (' faded' unless stages.any? { |x| %w[Release All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Release].include?(x) }).to_s + '">Deploy</text>'
    diagram << '<text x="898" y="371" class="text' + (' faded' unless stages.any? { |x| %w[Configure All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Configure].include?(x) }).to_s + '">Operate</text>'
    diagram << '<text x="672" y="371" class="text' + (' faded' unless stages.any? { |x| %w[Monitor All].include?(x) }).to_s + (' highlighted white_fill' if stages.any? { |x| %w[Monitor].include?(x) }).to_s + '">Monitor</text>'
    diagram << '<text x="50%" y="13" class="text text2' + (' faded' unless stages.any? { |x| %w[Secure All].include?(x) }).to_s + (' highlighted' if stages.any? { |x| %w[Secure].include?(x) }).to_s + '">Security</text>'
    diagram << '<text x="50%" y="488" class="text text2' + (' faded' unless stages.any? { |x| %w[Govern All].include?(x) }).to_s + (' highlighted' if stages.any? { |x| %w[Govern].include?(x) }).to_s + '">Compliance</text>'
    diagram << '</svg>'

    if stages.include? 'All'
      diagram
    else
      content = '{::nomarkdown}
      <style>'
      content += if stages.length > 3
                   '.diagramwrapper *{box-sizing:border-box}.diagramwrapper{width:100%;display:flex}.diagramwrapper .box{width:calc(100% - 390px);padding:10px;display:flex;background-color:#fff}.diagramwrapper .box svg{width:100%}.diagramwrapper .circle{width:50px;height:50px;margin-right:15px;border:#999 1px solid;border-radius:50%;display:inline-block;background-color:#fff;padding:0}.diagramwrapper .circle svg{fill:#524684;width:30px;margin:10px}.diagramwrapper .stages{display:flex;width:360px;margin-left:30px;flex-wrap:wrap}.diagramwrapper .stage{width:180px;display:flex;margin:auto 0}.diagramwrapper .stagename{display:inline-block;font-family:Source Sans Pro,sans-serif;font-weight:bold;font-size:20px;line-height:60px}'
                 else
                   '.diagramwrapper *{box-sizing:border-box}.diagramwrapper{width:100%;display:flex}.diagramwrapper .box{width:calc(100% - 240px);padding:10px;display:flex;background-color:#fff}.diagramwrapper .box svg{width:100%}.diagramwrapper .circle{width:80px;height:80px;margin-right:20px;border:#999 1px solid;border-radius:50%;display:inline-block;background-color:#fff;padding:0}.diagramwrapper .circle svg{fill:#524684;width:50px;margin:15px}.diagramwrapper .stages{display:flex;width:210px;margin-left:30px;flex-wrap:wrap}.diagramwrapper .stage{width:210px;display:flex;margin:auto 0}.diagramwrapper .stagename{display:inline-block;font-family:Source Sans Pro,sans-serif;font-weight:bold;font-size:24px;line-height:80px}'
                 end
      content += '</style><div class="diagramwrapper"><div class="box">' + diagram + '</div><div class="stages">'

      stages.each do |stage|
        content += '<div class="stage"><div class="circle">'
        fh = open "../../source/includes/icons/sdlc-icons/#{stage.downcase}.svg"
        content += fh.read
        fh.close
        content += '</div><div class="stagename">' + stage + '</div></div>'
      end

      content += '</div></div>
      {:/}'
      content
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/PerceivedComplexity
  # rubocop:enable Metrics/CyclomaticComplexity
end
