module Domain
  class Marca
    include Restfulie::Client::Base

    def self.entry_point
      "http://#{EDITORIAL_DOMAIN_HOST}/marcas"
    end

    def self.resource_name
      "marca"
    end

    def self.all
      get!.resource.marcas.each do |marca|
        class << marca
          include LinksHelper
        end
      end
    end

    uses_restfulie do |config|
      config.entry_point = entry_point
      config.default_headers = {
        :get => {'Accept' => 'application/json'}
      }
    end

    module LinksHelper
      %w[editorias rotulos_controlados].each do |sub_resource|
        define_method sub_resource do
          Restfulie.at(links.send(sub_resource).href).as("application/json").get!.resource.send(sub_resource)
        end
      end
    end
  end
end