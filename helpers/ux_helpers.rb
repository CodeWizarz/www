# frozen_string_literal: true

module UxHelpers
  def ux_grade(grade)
    link_to(
      image_tag("/images/grade/grade_#{grade}.svg", alt: "Badge level #{grade}"),
      "/handbook/product/ux/ux-scorecards/index.html#grading-rubric"
    )
  end
end
