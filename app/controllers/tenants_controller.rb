class TenantsController < ApplicationController
  # add controller methods
  # set :views, "app/views/tenants"

  get '/tenants' do
    @tenants = Tenant.all
    erb :'/tenants/index'
  end

  get '/tenants/new' do
    @apartments = Apartment.all
    erb :'/tenants/new'
  end

  post '/tenants' do
    tenant = Tenant.create(params)
    redirect '/tenants'
  end

  get '/tenants/:id' do
    @tenant = current_tenant
    erb :'/tenants/show'
  end

  get '/tenants/:id/edit' do
    @tenant = current_tenant
    @apartments = Apartment.all
    erb :'tenants/edit'
  end
  
  patch '/tenants/:id' do
    @tenant = current_tenant
    @tenant.update(params[:tenant])
    redirect "/tenants/#{@tenant.id}"
  end

  delete '/tenants/:id' do
    tenant = current_tenant
    tenant.destroy
    redirect '/tenants'
  end

  post '/tenants/:id' do
    tenant = current_tenant
    redirect "/tenants/#{tenant.id}/edit"
  end
  
  def current_tenant
    @tenant = Tenant.find(params[:id])
  end
end
