module CodeownersHelpers
  def codeowners_for_page(page)
    codeowners = Gitlab::CodeOwners.codeowners_for_page(page)

    codeowners
      .reject { |user| user == '@gitlab-com' }
      .map { |user| user_presenter.present(user) }
      .compact
  end

  def user_presenter
    @user_presenter ||= Gitlab::CodeOwners::UserPresenter.new(Gitlab::Homepage.team.members)
  end

  def single_owner_partial(user_info)
    %(
      <div class='codeowners-single-labels'>
        <div class='codeowners-description'>
          #{user_info[:description]}
        </div>
        <div class='codeowners-handle'>
          #{user_info[:gitlab_name]}
        </div>
      </div>
    )
  end

  def avatar_partial(user_info)
    has_photo = user_info[:image_url]
    has_photo ? avatar_image_partial(user_info) : avatar_group_partial(user_info)
  end

  def avatar_image_partial(user_info)
    description = user_info[:description]
    %(
      <img
        src='#{user_info[:image_url]}'
        class='codeowner-avatar-img'
        alt='#{description}'
        title='#{description}'
      >
    )
  end

  def avatar_group_partial(user_info)
    description = user_info[:description]
    %(
      <div class='codeowner-avatar-group' title='#{description}'>
        <span>#{map_to_initials(description)}</span>
      </div>
    )
  end

  def map_to_initials(description)
    return 'N/A' if description.blank?

    group_name = description.split('/').last
    group_name
      .delete_prefix('@')
      .chars.first
      .upcase
  end
end
