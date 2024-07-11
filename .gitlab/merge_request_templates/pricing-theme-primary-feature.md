## Pricing theme updates for primary features in Premium and Ultimate

Initiating a pricing theme for new primary features is required as part of the release post workflow. However, since review/alignment on this may take longer than the release post allows, please follow these steps to de-couple timeline dependencies:

## Before creating this MR

1. Confirm that when you created this MR, you followed the steps defined by [Pricing theme updates for primary features](.gitlab/merge_request_templates/Release-Post-Item.md).
1. Confirm you have created a separate ~"release post item" MR containing the release post entry and its addition to `features.yml`.
2. Confirm you have **not** included the `pricing_theme` field in that MR.

## Todo

- [ ] Set the MR title to **Add feature _name of feature_ to _name of pricing theme_**
- [ ] Reference [Pricing Themes](https://about.gitlab.com/company/pricing/#themes) and choose the relevant pricing theme
- [ ] Update the `pricing theme` field in [`data/features.yml`](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/data/features.yml)
- [ ] Add the following stakeholders as Reviewers and ask them for explicit Approval
     - your PMM counterpart
     - the Marketing team DRI `@supadhyaya`
     - your direct manager
- After the Marketing team DRI has approved, you can merge the MR 

/label ~"Product Operations" ~"Pricing Theme" 
