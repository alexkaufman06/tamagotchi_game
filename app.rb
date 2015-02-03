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
  @tamagotchi.time_passes(1)
  if @tamagotchi.is_alive?
    erb :game
  else
    @name = @tamagotchi.name
    @tamagotchi.destroy
    erb :dead
  end
end

post '/feed' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  @tamagotchi.sleep(1)
  @tamagotchi.play(1)
  @tamagotchi.feed(6)
  redirect back
end

post '/sleep' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  @tamagotchi.sleep(6)
  @tamagotchi.play(1)
  @tamagotchi.feed(1)
  redirect back
end

post '/play' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  @tamagotchi.sleep(1)
  @tamagotchi.play(6)
  @tamagotchi.feed(1)
  redirect back
end


get '/delete/:id' do
  to_delete = Tamagotchi.find(params['id'].to_i)
  to_delete.destroy
  redirect '/'
end
