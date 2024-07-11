require 'date'
require_relative 'stable_unique_id'

module MaturityHelpers
  include StableUniqueId

  def lifecycle(year)
    case year
    when 0
      "Not yet available (typically year 0)"
    when 1
      "Not used at GitLab Inc. (typically year 1)"
    when 2
      "Majority of users work at GitLab Inc. (typically year 2)"
    when 3
      "Majority of users don’t work at GitLab Inc. (typically year 3)"
    when 4
      "Usable for most GitLab users (typically year 4)"
    when 5
      "Users of other tools start to switch (typically year 5)"
    when 6
      "Entry point for new customers (typically year 6)"
    when 7
      "Best product in the market (typically year 7)"
    end
  end

  def lifecycle_recognition(year)
    case year
    when 1
      "Engineering (SPG)"
    when 2
      "Product (PM)"
    when 3
      "Marketing"
    when 4
      "Sales"
    when 5
      "Analyst report inclusion"
    when 6
      "Analyst leader quadrant"
    when 7
      "Analyst highest ranked"
    end
  end

  def maturity(category, milestone = Date.today)
    if milestone.today?
      category.maturity || "planned"
    elsif category.lovable && category.lovable <= milestone
      "lovable"
    elsif category.complete && category.complete <= milestone
      "complete"
    elsif category.viable && category.viable <= milestone
      "viable"
    elsif category.available && category.available <= milestone
      "minimal"
    else
      "planned"
    end
  end

  def stage_maturity(stages)
    data = {}

    stages.each do |stage|
      data[stage.key] = {}
      categories = stage.categories.select { |cat| cat.marketing && !cat.available.blank? }

      categories.each do |c|
        data[stage.key]['gitlab'] ||= 0
        data[stage.key]['gitlab'] += Gitlab::Homepage::Category.level(c.maturity) + 1

        next unless c.competitors

        c.competitors.each do |key, comp|
          data[stage.key][key] ||= 0
          data[stage.key][key] += Gitlab::Homepage::Category.level(comp['maturity']) + 1
        end
      end

      data[stage.key].each do |key, total|
        data[stage.key][key] = (total.to_f / categories.size).round(1)
      end
    end

    data
  end

  # Build the set of X axis points when maturity states change
  def get_category_maturity_dates(categories, start_date, end_date: Date.today.next_year)
    dates = []

    dates.push(start_date.strftime('%Y-%m-%d'))
    dates.push(Date.today.strftime('%Y-%m-%d'))
    dates.push(end_date.strftime('%Y-%m-%d'))
    dates |= categories.select { |category_key, category| category.available&.between?(start_date, end_date) }.collect { |category_key, category| category.available.strftime '%Y-%m-%d' }
    dates |= categories.select { |category_key, category| category.minimal&.between?(start_date, end_date) }.collect { |category_key, category| category.minimal.strftime '%Y-%m-%d' }
    dates |= categories.select { |category_key, category| category.viable&.between?(start_date, end_date) }.collect { |category_key, category| category.viable.strftime '%Y-%m-%d' }
    dates |= categories.select { |category_key, category| category.complete&.between?(start_date, end_date) }.collect { |category_key, category| category.complete.strftime '%Y-%m-%d' }
    dates |= categories.select { |category_key, category| category.lovable&.between?(start_date, end_date) }.collect { |category_key, category| category.lovable.strftime '%Y-%m-%d' }

    dates.uniq.sort
  end

  def maturity_chart(stage: nil, iso_start_date: "2019-01-01", embed: false)
    start_date = Time.parse(iso_start_date)

    # Get the set of categories, filtered if desired to a certain stage
    categories =  if stage
                    data.categories.select { |category_key, category| category.stage == stage && category.marketing }
                  else
                    data.categories.select { |category_key, category| category.marketing == true }
                  end

    dates = get_category_maturity_dates(categories, start_date)

    planned = []
    minimal = []
    viable = []
    complete = []
    lovable = []

    dates.each_with_index do |date, index|
      planned[index] = 0
      minimal[index] = 0
      viable[index] = 0
      complete[index] = 0
      lovable[index] = 0

      categories.each do |category_key, category|
        case maturity(category, Date.parse(date))
        when "planned"
          planned[index] += 1
        when "minimal"
          minimal[index] += 1
        when "viable"
          viable[index] += 1
        when "complete"
          complete[index] += 1
        when "lovable"
          lovable[index] += 1
        end
      end
    end

    unique_id = stable_unique_id('Chart', "maturity #{stage} #{iso_start_date}")

    locals = {
      stage: stage,
      dates: dates,
      planned: planned,
      minimal: minimal,
      viable: viable,
      complete: complete,
      lovable: lovable,
      embed: embed,
      unique_id: unique_id
    }
    partial('includes/maturity/maturity-chart.html.erb', locals: locals)
  end
end
