module RcrashRuby

  class Rcrash < ActiveResource::Base
    
    self.site = 'http://rcrash.com/listener/'
    self.element_name = 'crash'

  end
end

