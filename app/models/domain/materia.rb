module Domain
  class Materia  
                       
    def self.entry_point
      "http://#{EDITORIAL_DOMAIN_HOST}/materias/busca"                                                                
    end
    
    def self.all
      result = []
      Restfolia.at(entry_point).get.resultado.each do |item| 
        result << Restfolia.at(item.id).get
      end
      result
    end

  end
end
