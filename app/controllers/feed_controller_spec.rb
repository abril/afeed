class FeedController < ApplicationController
  def index     
    
     @materias = Domain::Materia.all

  end
end