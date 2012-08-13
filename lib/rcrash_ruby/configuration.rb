module RcrashRuby

  class Configuratiion

    ENABLED = false
    API_KEY = '[your API key here]'
    AVAILABLE_ENVS = %w{development test production any}
    ENVIRONMENT = 'production'
  
    attr_reader :enabled, :api_key, :environment

    def initialize
      if config = read_configuration
        @enabled = config[:enabled] || ENABLED
        @api_key = config[:api_key] || API_KEY
        @environment = config[:environment] || ENVIRONMENT
      else
        @enabled = ENABLED
        @api_key = API_EKY
        @envinronment = ENVIRONMENT
      end     
    end

    def is_ok?
      @enabled && @api_key != API_KEY && AVAILABLE_ENV.include?(@environment)
    end

    private

    def read_configuration
      begin
        YAML.load(File.read(File.join(Rails.root.to_s, "config", "rcrash_config.yml")))
      rescue
        [:rcrash]
      end
    end
  end
end
