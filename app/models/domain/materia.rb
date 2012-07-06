module Domain
  class Materia
    include Restfulie::Client::Base
    
    def initialize(materia)
      @materia = materia
    end            
    
    def get(attribute)
      @materia[attribute]
    end                  
    
    def self.entry_point
      "http://#{EDITORIAL_DOMAIN_HOST}/materias"                                                                
    end

    def self.resource_name
      "materias"
    end
    
    def self.all
      result = []
      get!.resource.materias.each do |item|
        result << Materia.new(get!(item[:id]))
      end
      return result
    end

    uses_restfulie do |config|
      config.entry_point = entry_point
      config.default_headers = {
        :get => {'Accept' => 'application/json'}
      }
    end

  end
end
