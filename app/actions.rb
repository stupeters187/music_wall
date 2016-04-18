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

