# frozen_string_literal: true

require 'faraday'
require 'open-uri'

module ApiRetry
  # API calls can fail to connect occasionally, which really shouldn't be a reason to fail entirely
  # Give them 5 goes, just to get past any transient network fail
  # wait_time_multiplier and max_retries can be configured,
  # but the default values are 1 second and 5 tries, respectively.
  def api_retry(wait_time_multiplier: 1, max_retries: 5)
    # This list of network_errors was originally taken from Bundler::Fetcher,
    # excluding Bundler::PersistentHTTP::Error.  It has had additional network
    # related errors added as they are encountered in failed builds.
    network_errors = [
      Timeout::Error, EOFError, SocketError, Errno::ENETDOWN, Errno::ENETUNREACH,
      Errno::EINVAL, Errno::ECONNRESET, Errno::ETIMEDOUT, Errno::EAGAIN,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError,
      Zlib::BufError, Errno::EHOSTUNREACH, OpenURI::HTTPError, Faraday::Error,
      OpenSSL::SSL::SSLError, Gitlab::Error::InternalServerError, Gitlab::Error::BadGateway,
      Gitlab::Error::ServiceUnavailable
    ]

    # We also include RuntimeError, to retry any unknown errors we may encounter more generally.
    errors_to_retry = network_errors + [
      RuntimeError
    ]

    tries = 0

    begin
      yield
    rescue *errors_to_retry => error # There may be more errors we should catch
      # ENV['API_RETRY_DISABLED'] is set to 'true' by default in spec/spec_helper.rb
      # So we don't retry errors in the test suite, except for the ApiRetry unit tests,
      # which specifically allow for it. In this case, just raise the error.
      raise error if ENV['API_RETRY_DISABLED'] == 'true'

      # If ENV['API_RETRY_DISABLED'] is either explicitly set to 'false' (as in the case of ApiRetry unit tests),
      # or if it is unset, we proceed with the retry logic. This means the default behavior is to retry, so
      # the method won't fail if we neglect to set the right ENV variables in specific CI jobs or local tasks that use it.
      wait_time = wait_time_multiplier * (tries + 1)
      puts "Received a known retriable exception #{error.class}; have failed #{tries} times so far"
      puts "Waiting #{wait_time} seconds to retry."
      sleep wait_time
      retry if (tries += 1) < max_retries
      puts "Giving up after #{max_retries} retries"
      raise error
    # rubocop:disable Style/RescueStandardError
    rescue => error # Some other error: log the class but don't retry; we can investigate later
      puts "Received an #{error.class} exception; not retrying"
      raise error
    end
    # rubocop:enable Style/RescueStandardError
  end
end
