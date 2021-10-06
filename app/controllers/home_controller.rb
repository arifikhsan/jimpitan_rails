class HomeController < ApplicationController
  def index
    render 'welcome' unless user_signed_in?

    @village = Village.new
  end

  def create

  end

  def welcome
  end
end
