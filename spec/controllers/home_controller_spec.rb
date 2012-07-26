require 'spec_helper'

describe HomeController do
  render_views

  context "on GET to /feed" do
    before do
      request.accept = "application/json"
      @get_args = [:index]
      get *@get_args
    end
    it "should render JSON" do
      response.content_type.should be == "application/json"
    end
    it_should_behave_like "a cached response"
  end
  
  #context "on GET to /concursos/novo_concurso" do
  #  before do
  #    request.accept = "application/json"
  #    @get_args = [:new]
  #    get *@get_args
  #  end
  #  it "should render JSON" do
  #    response.content_type.should be == "application/json"
  #    json = JSON.parse response.body
  #    json.keys.sort.should be == %w[concurso link]
  #    json["concurso"].should be_kind_of Hash
  #    json["link"].should be_kind_of Array
  #    
  #    json["concurso"]["categorias"].should be_kind_of Array
  #    json["concurso"]["rotulos_controlados"].should be_kind_of Array
  #    json["concurso"]["conteudos_relacionados"].should be_kind_of Array
  #    json["concurso"]["editorias"].should be_kind_of Array
  #    json["concurso"]["tags"].should be_kind_of Array
  #    
  #    json["link"].map{ |l| l["rel"] }.uniq.sort.should be == %w[concursos self]
  #  end
  #  it_should_behave_like "a cached response"
  #end
  
end
