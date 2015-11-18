require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class ChitterMessenger < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'try to guess'


  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
 end

  get '/' do
    erb :'users/index'
  end

  get '/users' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(firstname: params[:firstname],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/new' do
    erb :'users/new'
  end
  get '/confirm' do
    @username = params[:username]
    erb :'users/new'
  end

  get '/new_session' do
    erb :'sessions/new_session'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new_session'
    end
  end

  run! if app_file == $0

end
