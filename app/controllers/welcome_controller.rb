class WelcomeController < ApplicationController
  def index
    @my_name = params[:name] #Query Params to Requests
  end
end
