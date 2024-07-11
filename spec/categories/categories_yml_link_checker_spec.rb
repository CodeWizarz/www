require 'spec_helper'
require 'fileutils'
require_relative '../../lib/categories/categories_yml_link_checker'

describe Categories::CategoriesYmlLinkChecker do
  subject(:task) { described_class.new }

  before do
    allow(subject).to receive(:log)
  end

  context 'with default path' do
    let(:yaml_path) { nil }

    it 'succeeds' do
      # Use the real file in the success case, it will integration test against
      # unexpected formatting changes.
      expect(task).to receive(:log).with(/SUCCESS: categories.yml links are valid/)

      task.run
    end
  end

  context 'with fake path' do
    let(:tmpdir) { Dir.mktmpdir }
    let(:yaml_path) { "#{tmpdir}/bad_categories.yml" }

    after do
      FileUtils.remove_entry(tmpdir)
    end

    it 'fails due to missing documentation link' do
      File.write(yaml_path, <<~BAD_YAML)
        bad_category:
          name: "Missing Docs Category"
          maturity: minimal
          marketing: true
      BAD_YAML

      expected_exception_msg = 'ERROR: categories.yml had 1 bad categories'
      expect { task.run(yaml_path) }.to raise_error(expected_exception_msg)

      expect(task).to have_received(:log)
        .with(%(1. Bad Category: 'Missing Docs Category': 'minimal' maturity with no documentation link.))
    end

    it 'fails due to invalid direction link' do
      File.write(yaml_path, <<~BAD_YAML)
        missing_slash_fail:
          name: "Missing Slash in Direction link"
          direction: direction/relative_link

        absolute_url_fail:
          name: "Absolute Direction link"
          direction: https://about.gitlab.com/direction/absolute_link

        internal_direction_link_ok:
          name: "Absolute Direction link to Internal Handbook"
          direction: https://internal.gitlab.com/direction/absolute_link

        empty_direction_link_ok:
          name: "Empty Direction link"
          direction:

        no_direction_ok:
          name: "No Direction link"
          direction:
      BAD_YAML

      expected_exception_msg = 'ERROR: categories.yml had 2 bad categories'
      expect { task.run(yaml_path) }.to raise_error(expected_exception_msg)

      expect(task).to have_received(:log)
        .with(%(1. Bad Category: 'Missing Slash in Direction link': 'direction/relative_link' direction must be relative or link internal handbook.))
        .with(%(2. Bad Category: 'Absolute Direction link': 'https://about.gitlab.com/direction/absolute_link' direction must be relative or link internal handbook.))
    end
  end
end
