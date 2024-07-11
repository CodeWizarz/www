module Milestones
  # NOTE: Future iterations we will replace this method with methods that retrieve data from the API
  def milestone_to_date(milestone)
    milestones = {
      '14.3' => "September 22, 2021",
      '14.4' => "October 22, 2021",
      '14.5' => "November 22, 2021",
      '14.6' => "December 22, 2021",
      '14.7' => "January 22, 2022",
      '14.8' => "February 22, 2022",
      '14.9' => "March 22, 2022",
      '14.10' => "April 22, 2022",
      '15.0' => "May 22, 2022",
      '15.1' => "June 22, 2022",
      '15.2' => "July 22, 2022",
      '15.3' => "August 22, 2022",
      '15.4' => "September 22, 2022",
      '15.5' => "October 22, 2022",
      '15.6' => "November 22, 2022",
      '15.7' => "December 22, 2022",
      '15.8' => "January 22, 2023",
      '15.9' => "February 22, 2023",
      '15.10' => "March 22, 2023",
      '15.11' => "April 22, 2023",
      '16.0' => "May 22, 2023",
      '16.1' => "June 22, 2023",
      '16.2' => "July 22, 2023",
      '16.3' => "August 22, 2023",
      '16.4' => "September 22, 2023",
      '16.5' => "October 22, 2023",
      '16.6' => "November 22, 2023",
      '16.7' => "December 22, 2023",
      '16.8' => "January 22, 2024",
      '16.9' => "February 22, 2024",
      '16.10' => "March 22, 2024",
      '16.11' => "April 22, 2024",
      '17.0' => "May 22, 2024"
    }
    milestones.fetch(milestone, "unknown")
  end
end
