class RubbishController < ApplicationController
  def home
    @region = Region.all
  end

  def search
    @region = Region.all

    # 検索ワードなしの場合
    if params[:word].blank? then
      @rubbish_region = Rubbish.joins(:region).select("rubbishes.*,regions.name AS region_name").where(region_id: 1)

    # 検索ワードありの場合
    else
  
      # 検索条件の作成
      where_ary = []
      where_query = ""
      param_ary = params[:word].split(/\s*　\s*|\s* \s*/,100)
      param_ary.each do | s |
        where_ary << "%#{s}%" << "%#{s}%"
        where_query += 'rubbishes.name LIKE ? or rubbishes.name_kana LIKE ? or '
      end
      where_ary.insert(0,where_query[0,where_query.length-3])

      # @rubbish_region = Rubbish.joins(:region).select("rubbishes.*,regions.name AS region_name")
      #                               .where(region_id: 1)
      #                               .where('rubbishes.name LIKE ? or rubbishes.name_kana LIKE ?',"%#{params[:word]}%","%#{params[:word]}%")
      @rubbish_region = Rubbish.joins(:region).select("rubbishes.*,regions.name AS region_name")
                                    .where(region_id: 1)
                                    .where(where_ary)
    end

    render 'home'
  end
end
