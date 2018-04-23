class AdminController < ApplicationController

  before_action :authenticate_admin!


  def update
    @admin = Admin.find_or_initialize_by(id: params[:id])

    if @admin.persisted?
        j = JSON.parse(request.raw_post)
        @admin[:name] = j['name']
        @admin[:username] = j['username']
        @admin.save
        render :json => @admin, :status => 201
    else
      render :json => {}, :status => 404
    end
  end
end
