class RubbishController < ApplicationController
  def home
    @region = Region.all
    render 'home'
  end

  def search
  end
end
