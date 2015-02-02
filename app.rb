require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get '/' do
  @tamagotchis = Tamagotchi.all
  erb :index
end

post '/' do
  Tamagotchi.create(:name => params['name'])
  redirect back
end

get '/game/:id' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  while @tamagotchi.is_alive?
    erb :game
    @tamagotchi.time_passes(1)
    sleep 1
  end
  erb :game
end
