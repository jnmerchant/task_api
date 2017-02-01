require 'sinatra'
require_relative 'migrations/environment'
require_relative 'models/task'
require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get '/api/tasks' do
  tasks = Task.all

  [:id, :description, :priority, :completed].each do |filter|
    tasks = tasks.send(filter, params[filter]) if params[filter]
  end
  tasks.order('priority ASC, created_at DESC').to_json
end

get '/api/tasks/:sort' do |sort|
  tasks = Task.all.order(params[sort])
  tasks.to_json
end

get '/api/tasks/:id' do |id|
  task = Task.find_by_id(id)
  halt(404, {message: "Task not found"}.to_json) unless task
  task.to_json
end

post '/api/tasks' do
  task = Task.new(description: params[:description], priority: params[:priority])
  if task.valid?
    task.save
    [201, task.to_json]
  else
    status 400
  end
end

put '/api/tasks/:id' do |id|
  task = Task.find(id)
  halt(404, { message:'Task not found'}.to_json) unless task
  task.update(description: params[:description], priority: params[:priority], completed: params[:completed])
  task.to_json
end

delete '/api/tasks/:id' do |id|
  if ! Task.exists?(id)
    status 404
  else
    Task.destroy(id)
  end
end
