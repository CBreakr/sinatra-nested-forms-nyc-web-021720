require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get "/" do
      erb :root
    end

    get "/new" do
      erb :"pirates/new"
    end

    post "/pirates" do
      pirate_params = params["pirate"]
      @pirate = Pirate.new(pirate_params["name"], pirate_params["height"], pirate_params["weight"])
      ships_params = pirate_params["ships"]
      ship1_params = ships_params[0]
      ship2_params = ships_params[1]
      @ship1 = create_ship_from_params(ship1_params)
      @ship2 = create_ship_from_params(ship2_params)
      # binding.pry
      erb :"pirates/show"
    end

    def create_ship_from_params(params)
      ship = Ship.new(params["name"], params["type"], params["booty"])
    end

  end
end
