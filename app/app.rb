require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class DataRecorder < Sinatra::Base

  enable :sessions
  set :session_secret, 'try to guess'

  get '/' do
    erb :'links/signup'
  end

  post '/signup' do
    user = User.create(firstname: params[:firstname], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect("/confirm/#{params[:username]}")
  end

  get '/confirm/:username' do
    @username = params[:username]
    erb :'links/confirm'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

end
