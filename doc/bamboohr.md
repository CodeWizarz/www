# BambooHR Integration

## Prerequisites

Please ensure that you can [preview changes locally](development.md).

Access to the BambooHR API requires an API token. Scripts will be looking for
an environment variable called `BAMBOOHR_API_TOKEN`. If this does not exist,
you will be prompted for a token.

## Adding BambooHR IDs to existing team database entries

Employees that were created manually in [the team database](team_database.md) need to have their BambooHR
ID added for further comparison and synchronization to work.
The script `bin/sync-employee-number` supports this process by attempting to
match entries between BambooHR and [the team database](team_database.md). Execute this command:

    bundle exec bin/sync-employee-number

The script will update [the team database](team_database.md) and list matches it found or BambooHR entries
it couldn't match.

**Please note:** matches are based on similarity of names, roles and start
dates. It is strongly recommended to review the modified
[team database entries](team_database.md) and the
unmatched BambooHR entries before merging!

### Optional parameters

| Parameter         | Description                                  |
| ---------         | -----------                                  |
| `-n`, `--dry-run` | Preview changes without modifying any files. |
| `--csv FILE`      | Write matches/misses to a CSV file.          |
