class HomeController < ApplicationController
  def index     
    
     @materias = Domain::Materia.all

  end
end