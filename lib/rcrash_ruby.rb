require "rcrash_ruby/configuration"
require "rcrash_ruby/lcrash"
require "rcrash_ruby/rcrash"

module RcrashRuby
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, :with => :code_crashed if RcrashRuby.configuration.is_ok?
  end

  def self.configuration
    @configuration = RcrashRuby::Configuration.new
  end 

  protected

  def code_crashed(exception=nil)
    if exception
      Lcrash.new(
        exception, {
        :request => request,
        :params => params.to_s,
        :session_dump => session.inspect
      }).send_report
    end

    render 'public/500', :status => 500, :layout => false
  end
end

ActiveSupport.on_load(:action_controller) do
  include RcrashRuby
end
