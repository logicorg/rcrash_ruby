module RcrashRuby

  class Rcrash < ActiveResource::Base
    
    self.site = 'http://rcrash.lcl/listener/'
    self.element_name = 'crash'

  end
end

