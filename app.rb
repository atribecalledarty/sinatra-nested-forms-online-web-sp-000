require './environment'


module FormsLab
  class App < Sinatra::Base
    
    set :views, Proc.new { File.join(root, "views/pirates") }
    # code other routes/actions here
    get '/' do
      erb :
    end
    
    get '/new' do 
      erb :new
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      
      params[:pirate][:ship].each do |ship_details|
        Ship.new(ship_details)
      end
      
      @ships = Ship.all
      
      erb :show
    end
  end
end
