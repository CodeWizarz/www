module TierHelpers
  def available_in_array_to_tier_hash(availability_array)
    {
      gitlab_core: availability_array.include?('core'),
      gitlab_premium: availability_array.include?('premium'),
      gitlab_ultimate: availability_array.include?('ultimate'),
      gitlab_free: availability_array.include?('free'),
      gitlab_bronze: availability_array.include?('bronze'),
      gitlab_silver: availability_array.include?('silver'),
      gitlab_gold: availability_array.include?('gold')
    }
  end

  def serialize_tier_hash(tier_hash)
    {
      gitlab_core: tier_hash[:gitlab_core],
      gitlab_premium: tier_hash[:gitlab_premium],
      gitlab_ultimate: tier_hash[:gitlab_ultimate],
      gitlab_free: tier_hash[:gitlab_free],
      gitlab_bronze: tier_hash[:gitlab_bronze],
      gitlab_silver: tier_hash[:gitlab_silver],
      gitlab_gold: tier_hash[:gitlab_gold]
    }
  end
end
