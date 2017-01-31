require 'sinatra'
require_relative 'migrations/environment'
require_relative 'models/task'

get '/api/tasks' do
  Task.all.to_json
end

get '/api/tasks/:id' do |id|
  task = Task.find_by_id(id)
  halt 404, { message: 'Task Not Found' }.to_json unless task
  task.to_json
end

post '/api/tasks' do
  task = Task.new(description: params[:description], priority: params[:priority])
  if task.valid?
    task.save
    status 201
    task.to_json
  else
    status 400
  end
end

put '/api/tasks/:id' do |id|
  task = Task.find(id)
  task.update(description: params[:description], priority: params[:priority])
  task.to_json
end

delete '/api/tasks/:id' do |id|
  if ! Task.exists?(id)
    status 404
  else
    Task.destroy(id)
  end
end
