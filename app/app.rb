require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class DataRecorder < Sinatra::Base

  enable :sessions
  set :session_secret, 'try to guess'

  get '/' do
    erb :'links/index'
  end

  post '/signup' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect("/confirm/#{params{:username}}")
  end

  get '/confirm/:username' do
    @username = params[:username]
    erb :'links/confirm'
  end
end
