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

get '/single_game/:id' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  @tamagotchi.time_passes(1)
  if @tamagotchi.is_alive?
    erb :single_game
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

get '/load_game' do
  tamagotchis = params['tamagotchis']
  if tamagotchis.length == 1
    redirect ('/single_game/' + tamagotchis[0])
  elsif tamagotchis.length == 2
    redirect ('/double_game/' + tamagotchis[0] + "/" + tamagotchis[1])
  else

  end
end

get '/double_game/:id1/:id2' do
  @tamagotchi1 = Tamagotchi.find(params['id1'])
  @tamagotchi2 = Tamagotchi.find(params['id2'])
  @tamagotchi1.time_passes(1)
  @tamagotchi2.time_passes(1)
  if @tamagotchi1.is_alive? || @tamagotchi2.is_alive?
    erb :double_game
  else
    @name1 = @tamagotchi1.name
    @name2 = @tamagotchi2.name
    @tamagotchi1.destroy
    @tamagotchi2.destroy
    erb :double_dead
  end
end
