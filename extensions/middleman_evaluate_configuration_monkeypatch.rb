module Middleman
  class Application
    def evaluate_configuration!
      # Check for and evaluate local configuration in `config.rb`
      config_rb = File.join(root, 'config.rb')
      if ENV['MIDDLEMAN_CONFIG_FILE_NAME']
        custom_config_file_name = ENV['MIDDLEMAN_CONFIG_FILE_NAME']
        custom_config_rb = File.join(root, custom_config_file_name)
        logger.debug "== Reading: Local config: #{custom_config_file_name}"
        config_context.instance_eval File.read(custom_config_rb), custom_config_rb, 1
      elsif File.exist? config_rb
        logger.debug '== Reading: Local config: config.rb'
        config_context.instance_eval File.read(config_rb), config_rb, 1
      else
        # Check for and evaluate local configuration in `middleman.rb`
        middleman_rb = File.join(root, 'middleman.rb')
        if File.exist? middleman_rb
          logger.debug '== Reading: Local middleman: middleman.rb'
          config_context.instance_eval File.read(middleman_rb), middleman_rb, 1
        end
      end

      env_config = File.join(root, 'environments', "#{config[:environment]}.rb")
      return unless File.exist? env_config

      logger.debug "== Reading: #{config[:environment]} config"
      config_context.instance_eval File.read(env_config), env_config, 1
    end
  end
end
