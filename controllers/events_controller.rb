require('pry-byebug')
require_relative('../models/event.rb')



get '/events' do

  @events = Event.all
  erb :'events/index'

end



get '/events/new' do

  @events = Event.all
  erb :'events/new'

end



post '/events' do

  @event = Event.new(params)
  @event.save
  erb :'events/create'

end



get '/events/:id' do

  @event = Event.find(params[:id])
  erb :'events/show'

end



get '/events/:id/edit' do

  @event = Event.find(params[:id])
  erb :'events/edit'

end



put '/events/:id' do

  @event = Event.update(params)
  redirect to("events/#{params['id']}")

end



delete '/events/:id' do

  Event.delete(params[:id])
  redirect to('/events')

end






