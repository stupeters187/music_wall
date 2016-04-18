# Homepage (Root path)
get '/' do
  erb :index
end

get '/music' do
  @songs = Song.all
  erb :'music/index'
end

get '/music/new' do
  erb :'music/new'
end

post '/music' do
  @song = Song.new(
    author:     params[:author],
    song_title: params[:song_title],
    url:        params[:url]
    )
  if @song.save
    redirect '/music'
  else
    erb :'music/new'
  end
end

get '/music/:id' do
  @music = Song.find params[:id]
  erb :'music/show'
end

get '/signup' do
  erb :signup 
end

post '/signup' do 
  if params[:password] == params[:password_confirmation]
    user = User.create(
      email: params[:email],
      password: params[:password]
      )
    session[:user_id] = user.id
    redirect '/music'
  end
end



