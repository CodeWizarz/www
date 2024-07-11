module Lint
  class HandbookLinkLinter
    class BareAnchorChecker
      TEMPORARY_IGNORED_ANCHORS = [
        '-if-you-want-to-share-newsan-update-or-are-seeking-feedback',
        'Accepting risks identified during the procurement process',
        'ad-hoc-import',
        'advocate-for-a-day',
        'alliance-event-upload',
        'create-a-new-post',
        'cta',
        'customer-lifecycle',
        'customers',
        'declaring-an-incident',
        'deprecation',
        'dismissing-a-vulnerability',
        'feature-blocks',
        'field-and-corporate-event-import',
        'finding-the-existing-organization-in-customersgitlabcom',
        'getting-started',
        'hacker-news',
        'how-to-add-an-event-to-the-eventsyml',
        'how-to-add-events-to-aboutgitlabcomevents',
        'how-to-use',
        'html-parser',
        'import-asap',
        'import-cleaning-template',
        'improvements',
        'incident-review-issue-creation-and-ownership',
        'initial-account-owner---based-on-segment',
        'it-ops',
        'moving-a-feature-down',
        'mvp-check',
        'offer-authorization',
        'our-events-list',
        'prioritization',
        'quote',
        'security-operations',
        'security-severity-labels',
        'single-vetos',
        'test-is-stale-due-to-application-change',
        'the-process-in-action-1',
        'the-process-in-action-2',
        'top-three-features',
        'tracking-content',
        'training-videos',
        'visualization'
      ].freeze

      def initialize(doc, element)
        @doc = doc
        @element = element
        @anchor = element.attr['href'].split('#').last
        @errors = []
      end

      attr_reader :errors

      def valid?
        return true if TEMPORARY_IGNORED_ANCHORS.include?(anchor)

        anchors = AnchorExtractor.instance.fetch_from_doc(doc)

        return true if anchor.blank?
        return true if anchors.include?(anchor)

        errors << LinterError.new(element.options[:location], description: "Anchor #{anchor} cannot be found".red)

        false
      end

      private

      attr_reader :doc, :element, :anchor
    end
  end
end
