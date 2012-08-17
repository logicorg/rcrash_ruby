module RcrashRuby

  class Lcrash

    attr_accessor :api_key,
                  :exception,
                  :inspection,
                  :crash_src,
                  :crash_type,
                  :message,
                  :backtrace,
                  :environment,
                  :session_dump,
                  :environment_dump

    def initialize(exception, data={})
      @api_key = RcrashRuby.configuration.api_key
      @exception = exception
      @inspection = exception.inspect
      @crash_src = extract_crash_src(exception)
      @crash_type = extract_crash_type(exception)
      @message = exception.message
      @backtrace = exception.backtrace
      @environment = Rails.env || ''
      @session_dump = data[:session_dump] || ''
#      @request_env = data[:request].env || ''
      @request_ip = data[:request].remote_ip || ''
      @request_url = data[:request].url || ''
      @request_params = data[:params] || ''
      @crashed_at = DateTime.now
    end

    def send_report
      if available_reporting?
        Rcrash.create(
          :api_key => @api_key,
          :exception => @exception,
          :inspection => @inspection,
          :crash_src => @crash_src,
          :crash_type => @crash_type,
          :message => @message,
          :backtrace => @backtrace,
          :environment => @environment,
          :session_dump => @session_dump,
  #        :request_env => @request_env,
          :request_ip => @request_ip,
          :request_url => @request_url,
          :request_params => @request_params,
          :crashed_at => @crashed_at)
      end
    end

    private

    def extract_crash_src(exception)
      if t = src_type_table(exception)
        t.take(t.length-1)
      end
    end

    def extract_crash_type(exception)
      if t = src_type_table(exception)
        t.last
      end
    end

    def src_type_table(exception)
      exception.inspect.to_s.inspect.gsub('"#<', '').split(' ')[0].split(':').delete_if { |i| i.eql?('') }
    end

    def available_reporting?
      c = RcrashRuby.configuration
      a = c.api_key

      c &&
        c.enabled &&
        # checks below are kept only to reduce network traffic to rcrash.com
        # all the checks are also performed on the server site
        a.match(/^\w{20}$/) &&                                          # 20 characters
        a[0..15].split(//).sum{ |m| m.ord } == a[16..19].to_i(16) &&    # valid checksum
        a[10..14].to_i(16) >= Date.today.mjd &&                         # key not expired
        (a[15] == 'A' || Rails.env.production?)                         # proper environment
    end
  end
end

