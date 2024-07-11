# Team member data schema

You can find instructions on how to update your own entry [in the handbook](https://about.gitlab.com/handbook/git-page-update/#12-add-yourself-to-the-team-page).

Every team member has their own file under: `{first_letter_of_slug}/{slug}.yml`.
So a team member with the slug `tanuki` can find their file under: `t/tanuki.yml`.
Here is a link to dz's file: [`d/dz.yml`](./d/dz.yml).

You can rename your file, but make sure that it is still in the correct folder.
Danger will let you know if you accidentally put a file in the wrong index directory.
So if `tanuki` wants to rename themselves to `japanese-raccoon-dog`, they need to move
their file from `t/tanuki.yml` to `j/japanese-raccoon-dog.yml`.

The `slug` is a human-readable unique id based on the person's name or a vacancy's title.
It is used for the `reports_to` property.

## Data Structure:

| Property           | Required | Example             | Description |
|--------------------|----------|---------------------|-------------|
| `name`             | `true`   | `Eric 'EJ' Johnson` | Person's name as the person wants it to appear on the team page. It's fine to add different scripts than Latin, or abbreviate parts of your name if you do not want them to appear publicly. |
| `pronunciation`    | `false`  | `sean kah-rul`      | Free text field to help with pronunciation of your name. Can be pseudo-pronunciation, contain IPA or links  |
| `locality`         | `false`  | `Kharkiv`           | The text location within a country of the person. Can be omitted |
| `country`          | `false`  | `Ukraine`           | The text of the country of the person. Can be left empty. If the country is empty, the person will not appear on the map |
| `role`             | `true`   | see below           | HTML link describing the role. Link to the full title including speciality. |
| `reports_to`       | `true`   | `sid`               | A person slug, will be validated to exist. Can be omitted in certain circumstances, like for board members, advisors or core team members. This slug is the name of the manager's `yml` file. |
| `borrow`           | `false`  | see below           | An object with the `to` and `end_date` keys. Only applicable when the team member is borrowed to a team. `to` is the borrowing manager' `slug` (it is validated to exist). `end_date` is the date until when the team member is borrowed. Should respect the `YYYY-MM-DD` format. |
| `work_priorities`  | `false`  | see below           | An array of current work priorities. |
| `picture`          | `false`  | `dmitriy.png`       | The filename of a picture in [`/sites/uncategorized/images/team`][images]. Ensure that this is a perfect square and <= 400x400 pixels |
| `linkedin`         | `false`  | `dzaporozhets`      | The url fragment for [your linkedin profile][linkedin-profile-url]. Use only the part that comes after `/in/` |
| `twitter`          | `false`  | `dzaporozhets`      | A Twitter handle (without the @ symbol) |
| `gitlab`           | `true`   | `dzaporozhets`      | A GitLab.com handle (without the @ symbol). Regularly synced with BambooHR. Can be omitted in certain circumstances, like for board members, advisors or core team members |
| `pronouns`         | `false`  | `she/her`           | Preferred pronouns.  Will link to http://pronoun.is/ |
| `mentor`           | `false`  | true                | Identify as a mentor. Will link to https://about.gitlab.com/handbook/engineering/career-development/mentoring/ |
| `departments`      | `true`   | see below           | Array of Strings containing the person's departments. For Engineering stage specific departments, use the same naming as shown in `be_team_tag` and `fe_team_tag` in [stages.yml](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/data/stages.yml). Synced with BambooHR |
| `specialty`        | `false`  | see below           | A string or array of strings containing the person's specialty. Synced with BambooHR |
| `projects`         | `false`  | see below           | Object of values from [`projects.yml`][projects], together with the role in the projects |
| `expertise`        | `false`  | `<b>HTML</b>`       | HTML of the person's expertises |
| `domain_expertise` | `false`  | see below           | Array of expertises from [`domain_expertise.yml`][domain_expertise] |
| `story`            | `false`  | `Some string`       | Text of the person's biography |
| `remote_story`     | `false`  | `A long story`      | Person's remote story, will be published on: https://about.gitlab.com/company/culture/all-remote/stories/ |
| `division`         | `true`   | `People Group`      | Person's current division in Workday, automatically updated if changed. |
| `job_title`        | `true`   | `Backend Engineer`  | Person's current job title in Workday, automatically updated if changed. |


- Example for `role`:

  - `<a href="https://handbook.gitlab.com/job-families/engineering/backend-engineer/">Staff Backend Engineer</a>`
  - `<a href="https://handbook.gitlab.com/job-families/engineering/development/management/#senior-engineering-manager">Senior Engineering Manager, Fulfillment</a>`

- Example for `borrow`:

    ```yaml
    borrow:
      to: ramya-authappan
      end_date: 2023-09-15
    ```

- Example for `departments`:

    ```yaml
    departments:
      - People Group
      - People Success
    ```

    ```yaml
    departments:
      - Engineering Function
      - Development Department
      - Fulfillment Section
      - Fulfillment Sub-department
      - Fulfillment:Purchase Team
      - Fulfillment:Purchase BE Team
      - Backend
    ```

- Example for `work_priorities`:

    ```yaml
    work_priorities:
      - Product Analytics
      - ModelOps
    ```

    To see accepted **case-sensitive** values, see `data/schemas/team_member.schema.json`.

- Example for `specialty`:
    ```yaml
    specialty:
      - 'Fulfillment'
      - 'Fulfillment: Purchase'
      - 'Fulfillment: License'
      - 'Fulfillment: Utilization'
    ```

- Example for `projects`:

    ```yaml
    projects:
      gitlab: maintainer backend
      gitlab-gollum-lib: reviewer backend
    ```

- Example for `domain_expertise`:

    ```yaml
    domain_expertise:
      - rails
      - graphql
      - design_management
      - create
    ```

[projects]: ../../projects.yml
[domain_expertise]: ../../domain_expertise.yml
[images]: ../../../sites/uncategorized/source/images/team
[linkedin-profile-url]: https://www.linkedin.com/help/linkedin/answer/49315/find-your-linkedin-public-profile-url
