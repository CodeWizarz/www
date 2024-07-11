# frozen_string_literal: true

module ServiceMaturityHelpers
  GREEN_CHECK = '✅'
  RED_X = '❌'
  WHITE_CIRCLE = '⚪'
  MINUS = '➖'

  def maturity_score(maturity)
    [
      maturity['level'] == 'Level 0' ? RED_X : nil,
      maturity['level']
    ].compact.join(" ")
  end

  def maturity_details(maturity)
    maturity['details'] || []
  end

  def maturity_evidence(criterion)
    return "#{WHITE_CIRCLE} (not implemented)" if criterion_unimplemented?(criterion)

    if criterion_skipped?(criterion)
      reason = Array(criterion.evidence).compact.join(", ")
      return "#{MINUS} (skipped)<br/>Reason: #{reason}"
    end

    return RED_X if criterion_failed?(criterion)

    evidence_links = Array(criterion.evidence).map.with_index do |evidence, i|
      url = evidence.try(:url).presence || evidence

      %W[<a href="#{html_escape(url)}">#{i.succ}</a>]
    end

    evidence_links.unshift(GREEN_CHECK).join(' ')
  end

  def maturity_headers(maturity, index)
    maturity_details(maturity.first.last).flat_map do |level|
      level.criteria.map.with_index do |criterion, i|
        [i.zero? ? [level.name, level.criteria.length] : [nil, 1], [criterion.name, 1]]
      end
    end[index] || [['Oops', 1], ['Broken', 1]]
  end

  def criterion_passed?(criterion)
    criterion.result == 'passed'
  end

  def criterion_failed?(criterion)
    criterion.result == 'failed'
  end

  def criterion_skipped?(criterion)
    criterion.result == 'skipped'
  end

  def criterion_unimplemented?(criterion)
    criterion.result == 'unimplemented'
  end
end
