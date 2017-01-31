require 'sinatra'
require_relative 'migrations/environment'
require_relative 'models/task'

get '/api/tasks' do
  Task.all.to_json
end

get '/api/tasks/:id' do |id|
  # TODO: is there an active record method that doesn't raise an error and instead returns nil when not found?
  begin
    Task.find(id).to_json
  rescue ActiveRecord::RecordNotFound
    status 404
  end

  # if task.nil?
  #   status 404
  # else
  #   task.to_json
  # end
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
  # TODO: better way without begin rescue?
  begin
    Task.destroy(id)
  rescue ActiveRecord::RecordNotFound
    status 404
  end
end
