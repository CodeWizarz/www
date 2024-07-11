module Gitlab
  module CodeOwners
    class UserPresenter
      PATH_TO_IMAGES = '/images/team/'.freeze
      PLACEHOLDER_IMAGE = 'gitlab-logo-extra-whitespace.png'.freeze

      def initialize(team)
        @team = team
      end

      def present(username)
        return render(username) unless gitlab_name?(username)

        gitlab_name = username.gsub(/@/, '')
        user = team.find { |user| user.gitlab == gitlab_name }

        return render(username, url: "https://gitlab.com/#{gitlab_name}", gitlab_name: username) unless user

        render(user.name, url: "https://gitlab.com/#{gitlab_name}", gitlab_name: username, image_url: user.avatar_url)
      end

      private

      attr_reader :team

      def render(description, url: nil, gitlab_name: nil, image_url: nil)
        {
          description: description,
          image_url: image_url,
          url: url,
          gitlab_name: gitlab_name
        }
      end

      def gitlab_name?(username)
        username.start_with?('@')
      end
    end
  end
end
