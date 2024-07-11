module CategoryHelpers
  def active_categories(categories)
    categories
      .select { |category| category.marketing? && category.unplanned? }
      .sort_by(&:maturity_level)
      .reverse
  end

  def planned_categories(categories)
    categories
      .select { |category| category.marketing? && category.planned? }
  end

  def available_categories(categories, date)
    categories
      .select { |category| category.marketing? && category.available_before(date) }
      .sort_by { |category| category.maturity_level_on_date(date) }
      .reverse
  end

  def unavailable_categories(categories, date)
    categories
      .select { |category| category.marketing? && category.available_after(date) }
  end
end
