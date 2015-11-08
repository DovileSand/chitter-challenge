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
    erb :'links/index'
  end

  get '/users/new' do
    erb :'links/users'
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
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'links/users/new'
    end
  end

  get '/confirm' do
    @username = params[:username]
    erb :'links/index'
  end

  run! if app_file == $0

end
