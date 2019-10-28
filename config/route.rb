require 'require_all'
require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'

require_all 'app'

class Route < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get '/costs' do
  end

  post '/distances' do
  end
end
