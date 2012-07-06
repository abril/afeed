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
      "http://#{EDITORIAL_DOMAIN_HOST}/materias/busca"                                                                
    end

    def self.resource_name
      "materia"
    end
    
    def self.all
      result = []  
      get!.resource.resultado.each do |item|           
        result << Materia.new(Restfulie.at(item.id).get.resource)
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
