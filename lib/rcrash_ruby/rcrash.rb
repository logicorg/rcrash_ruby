module RcrashRuby

  class Rcrash < ActiveResource::Base
    
    self.site = 'http://localhost:3333/listener/'
    self.element_name = 'crash'

  end
end

