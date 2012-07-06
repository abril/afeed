module Domain
  class Categoria
    include Restfulie::Client::Base

    def self.entry_point
      "http://#{EDITORIAL_DOMAIN_HOST}/categorias"
    end

    def self.resource_name
      "categorias"
    end
    
    def self.all
      get!.resource.categorias
    end

    uses_restfulie do |config|
      config.entry_point = entry_point
      config.default_headers = {
        :get => {'Accept' => 'application/json'}
      }
    end

  end
end
