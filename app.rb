require 'sinatra'
require_relative 'migrations/environment'
require_relative 'models/task'

# get '/api/tasks' do
#   Task.all.to_json
# end

post '/api/task/update' do
  Task.new({:description => 'find horse-dagger', :priority => 'extreme'})
end
