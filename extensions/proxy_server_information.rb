# frozen_string_literal: true

require 'middleman'

class ProxyServerInformation < Middleman::Extension
  def_delegator :@app, :logger

  def ready
    logger.info '== Webpack proxy server enabled: use "http://localhost:4567" or "http://127.0.0.1:4567"'
    logger.info '== Please ignore the following two lines - they will be missing necessary assets.'
  end
end

::Middleman::Extensions.register(:proxy_server_information, ProxyServerInformation)
