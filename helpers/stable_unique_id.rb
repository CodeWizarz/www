require 'digest/sha2'

module StableUniqueId
  private

  def stable_unique_id(prefix, unique_string)
    unique_sha = Digest::SHA256.hexdigest(unique_string || '')
    "#{prefix}#{unique_sha}"
  end
end
