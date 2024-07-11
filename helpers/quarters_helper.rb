require 'date'
require 'time'

module QuartersHelper
  Quarter = Struct.new(:quarter, :months, :calendar_year_end, :fiscal_year) do
    def ends_at
      Date.new(calendar_year_end, months.last, Date.new(calendar_year_end, months.last, -1).day)
    end

    def name
      "Q#{quarter}"
    end
  end

  def quarters
    quarters = [
      Quarter.new(4, [11, 12, 1], 2023, 2023),
      Quarter.new(1, [2, 3, 4], 2023, 2024),
      Quarter.new(2, [5, 6, 7], 2023, 2024),
      Quarter.new(3, [8, 9, 10], 2023, 2024),
      Quarter.new(4, [11, 12, 1], 2024, 2024),
      Quarter.new(1, [2, 3, 4], 2024, 2025),
      Quarter.new(2, [5, 6, 7], 2024, 2025),
      Quarter.new(3, [8, 9, 10], 2024, 2025),
      Quarter.new(4, [11, 12, 1], 2025, 2025),
      Quarter.new(1, [2, 3, 4], 2025, 2026),
      Quarter.new(2, [5, 6, 7], 2025, 2026),
      Quarter.new(3, [8, 9, 10], 2025, 2026),
      Quarter.new(4, [11, 12, 1], 2026, 2026),
      Quarter.new(1, [2, 3, 4], 2026, 2027),
      Quarter.new(2, [5, 6, 7], 2026, 2027),
      Quarter.new(3, [8, 9, 10], 2026, 2027),
      Quarter.new(4, [11, 12, 1], 2027, 2027)
    ]

    current_year = Date.today.year
    current_month = Date.today.month
    current_quarter = quarters.find do |quarter|
      if [11, 12].include?(current_month)
        quarter.calendar_year_end == current_year + 1
      else
        quarter.calendar_year_end == current_year && quarter.months.include?(current_month)
      end
    end

    current_quarter_index = quarters.index(current_quarter)
    quarters.slice(current_quarter_index, 4)
  end
end
