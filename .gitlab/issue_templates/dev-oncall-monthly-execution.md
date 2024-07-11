**Background**:

Handbook Entry https://about.gitlab.com/handbook/engineering/development/processes/Infra-Dev-Escalation/
See epic https://gitlab.com/groups/gitlab-com/-/epics/122

**Instructions**:

* Directors and Managers: Sign up as coordinator for the month, please **assign** this issue to yourself, and update the sign up sheet (link below) **Coordinator** column.
  * If you are signing up well in advanced of your coordination duties, consider setting a calendar reminder to go over assignments before the end of the previous month. You may also set a due date on this issue to get GitLab reminders. 
* Engineers: sign up slots in the [scheduling spreadsheet](https://docs.google.com/spreadsheets/d/10uI2GzqSvITdxC5djBo3RN34p8zFfxNASVnFlSh8faU/edit#gid=382724865).
* To assist assignment exercise, here are [eligible engineers and their timezones](https://docs.google.com/spreadsheets/d/1Uug3QHeGYobzUbB2ajJsw7CKe7vy1xRdflO5FOuHgDw/edit#gid=2117413239). This spreadsheet is popluated automatically by the [Employment Automation](https://gitlab.com/gitlab-com/people-group/peopleops-eng/employment-automation/-/blob/main/lib/syncing/on_call_scheduling_spreadsheet.rb).
* There is additional information regarding weekend shifts, which can be found in this shared document "[Additional Notes for Weekend Shifts](https://docs.google.com/document/d/1iMmlYQf6vdmen0e3iuEksgiTxKJvjnidcalwaa47jwE/edit#heading=h.z5unm4odw6zw)".
* A nice handy tool for coordinators to find available engineers quickly without going through multiple spreadsheets above.
  * Instructions: https://gitlab.com/gitlab-com/dev-on-call
  * Video: https://www.youtube.com/watch?v=D0bR0WnvdgM
* The manual process for coordinators is documented in this process page [how-to](https://about.gitlab.com/handbook/engineering/development/processes/Infra-Dev-Escalation/process.html#how-to)
  * Note the recommendation to check the team members' calendar to ensure they are available. This will help ensure team members are not scheduled when on leave, and reduce the need for rescheduling. 
* Coordinator: publish on-call schedule to the [shared calendar](https://calendar.google.com/calendar/u/0/embed?src=gitlab.com_vj98gounb5e3jqmkmuvdu5p7k8@group.calendar.google.com).
  1. Keep the tab of the month active (displayed).
  1. Use the menu `Sync to Calendar` on the menu bar. It takes 3\~5 minutes.
  1. Verify the calendar `On-call schedule shifts` is populated. This is currently a manual process to verify all slots are filled.  If there are open slots on the `On-call schedule shifts` calendar you can either manually add them to the calendar or debug the on-call spreadsheet. Typically when calendar slots remain open there is a data integrity issue within columns E or F for the given time slot.  **It is safe to run `Sync To Calendar` multiple times, it is idempotent**.
  1. If you run into failures of calendar sync, double check if the calendar ID is in cell 197C and the calendar link is in cell 198C. If you receive the message `TypeError: Cannot read property 'getName' of nullDetails`, you may need permission to manage the Google Calendar. Ping Chun Du on slack. 
  2. If you are still having any other calendar sync errors, please add the Google [Calendar](gitlab.com_vj98gounb5e3jqmkmuvdu5p7k8@group.calendar.google.com) for On-call schedule shifts to your calendar and retry to `Sync to Calendar`.
* Coordinator: close this issue when the month wraps up.

**Action items and due dates**:

* [ ] Coordinator calling for sign-up and doing assignments: start around 15th of the previous month
  * [ ] Posting reminders to the #development and #backend channels in Slack
  * [ ] Ask managers in #eng-managers to remind team-members in 1-1s
* [ ] Coordinator nomination: all **assigned** engineers are notified by mentioning them by name in this issue **explicitly**
  * [ ] Engineers who are on leave should inform Coordinator and the Coordinator should find an appropriate engineer.  
  * [ ] Engineers are encouraged to help the Coordinator by seeking replacements for time-slots that don't work for them.  Swap for like days/shifts later in the schedule by reaching out to your peers directly.  Engineers who are unsuccessful in finding a replacement please work with Coordinator to find a solution. 
  * Example wording for assignment notification and encouraging individuals to seek swapping shifts can be found [here](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/8330#note_416317851)
* [ ] All slots are signed up: due by 2 days before the 1st of the month
* [ ] Coordinator publishes on-call schedule to the shared calendar when all slots are confirmed. (see instructions above)

**Additional Information**

* For more detail of other information, please refer to [process documentation](https://about.gitlab.com/handbook/engineering/development/processes/Infra-Dev-Escalation/process.html).

/label ~"Engineering Management" 
/epic https://gitlab.com/groups/gitlab-com/-/epics/122
