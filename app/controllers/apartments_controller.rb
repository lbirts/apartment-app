class ApartmentsController < ApplicationController
  # add controller methods

  # set :views, "app/views/apartments"

  get '/apartments' do
    @apartments = Apartment.all
    erb :'/apartments/index'
  end

  get '/apartments/new' do
    @tenants = Tenant.all
    erb :'/apartments/new'
  end

  post '/apartments' do
    app = Apartment.create(params[:apartment])
    redirect '/apartments'
  end

  get '/apartments/:id' do
    @apartment = current_apartment
    erb :'/apartments/show'
  end

  get '/apartments/:id/edit' do
    @apartment = current_apartment
    @tenants = Tenant.all
    erb :'/apartments/edit'
  end
  
  patch '/apartments/:id' do
    @apartment = current_apartment
    @apartment.update(params[:apartment])
    redirect "/apartments/#{@apartment.id}"
  end

  delete '/apartments/:id' do
    apartment = current_apartment
    apartment.destroy
    redirect '/apartments'
  end

  post '/apartments/:id' do
    apartment = current_apartment
    redirect "/apartments/#{apartment.id}/edit"
  end
  
  def current_apartment
    @apartment = Apartment.find(params[:id])
  end
end
