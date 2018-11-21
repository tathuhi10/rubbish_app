class RubbishController < ApplicationController
  def home
    @region = Region.all
  end

  def search
    @region = Region.all
    @rubbish_region = Rubbish.joins(:region).select("rubbishes.*,regions.name AS region_name")
                              .where('rubbishes.name LIKE ?', "%#{params[:word]}%")
    render 'home'
  end
end
