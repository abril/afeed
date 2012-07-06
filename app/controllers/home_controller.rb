class HomeController < ApplicationController
  def index     
    
     @materias = Domain::Materia.all
     debugger
  end
end