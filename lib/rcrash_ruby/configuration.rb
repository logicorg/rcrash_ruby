module RcrashRuby

  class Configuration

    CONFIG_FILE = "config/rcrash.yml"
    ENABLED = false
    API_KEY = '[your API key here]'
    AVAILABLE_ENVS = %w{development test production any}
    ENVIRONMENT = 'production'
  
    attr_reader :enabled, :api_key, :environment

    def initialize
      if config
        @enabled = config["enabled"] || ENABLED
        @api_key = config["api_key"] || API_KEY
        @environment = config["environment"] || ENVIRONMENT
      else
        @enabled = ENABLED
        @api_key = API_KEY
        @envinronment = ENVIRONMENT
      end     
    end

    def is_ok?
      @enabled && @api_key != API_KEY && AVAILABLE_ENVS.include?(@environment)
    end

    private

    def config
      begin
        YAML.load(File.read(CONFIG_FILE))["rcrash"]
      rescue
        nil
      end
    end
  end
end
