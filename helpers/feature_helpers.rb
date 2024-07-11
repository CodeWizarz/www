module FeatureHelpers
  def missing_feature(feature)
    !(feature.gitlab_core || feature.gitlab_starter || feature.gitlab_premium || feature.gitlab_ultimate)
  end

  def get_carousel_item(title, link, image, type)
    item_object = { title: title, link: link, image: image, type: type }
    Struct.new(*item_object.keys).new(*item_object.values)
  end

  def works_by_default_table(category: nil, group: nil, stage: nil, section: nil)
    categories = []

    categories = [category] unless category.nil?

    unless group.nil?
      categories = Gitlab::Homepage::Category.all!
        .select { |category| category.group == group }
        .map(&:key)
    end

    unless stage.nil?
      categories = Gitlab::Homepage::Category.all!
        .select { |category| category.stage == stage }
        .map(&:key)
    end

    features = data.features.features
      .reject { |feature| feature.works_by_default.nil? }
      .reject { |feature| (categories & (feature.category || [])).empty? }

    partial('includes/works_by_default_table.html.erb', locals: { features: features })
  end
end
