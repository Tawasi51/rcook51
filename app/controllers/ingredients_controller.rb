require 'json'
require 'net/http'
require 'uri'

class IngredientsController < ApplicationController
  def index
    @ingredient = Ingredient.new
    @ingredients = Ingredient.includes(:user)
    # @ingredient = Ingredient.select("list")
    # uri =  URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20121121?applicationId=1094957104355351321&categoryId=#{@ingredient.list}")
    #    json = Net::HTTP.get(uri)
    #    @result = JSON.parse(json)
    #    @result = @result["result"]

  end
  def new
    @ingredient = Ingredient.new
  end
  
  
  def show

    uri =  URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20121121?applicationId=1094957104355351321&categoryId=#{$category}")
    json = Net::HTTP.get(uri)
    @result = JSON.parse(json)
    @result = @result["result"]

  end
  
  def update
     @item.update(like)
      
  end

  def create
    @ingredient = Ingredient.new
  end

  def like
    # params:[gamelist]で配列の値を取得可能。
    # 二次元配列の場合、受取先の変数を2つ宣言する。下記例では、
    # di1がタイトル、di2がチェックボックスの状態(0 or 1)が格納される。
    
    params[:list].each do | di1,di2 |
     
      # チェックボックスにチェックがついている場合
      if di2 == "1"
        # DBのtitleカラムにタイトルを格納し保存
        @ingredient = Ingredient.new(list:di1)
        @ingredient.save
        $category = @ingredient.list
      end
    end
    redirect_to  ("/ingredients/show") 
      #   uri =  URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20121121?applicationId=1094957104355351321&categoryId=#{@ingredient.list}")
      #  json = Net::HTTP.get(uri)
      #  @result = JSON.parse(json)
      #  @result = @result["result"]
      #  return 
    # q
  end
  def search
    uri =  URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20121121?applicationId=1094957104355351321&categoryId=#{@ingredient.list}")

       json = Net::HTTP.get(uri)
       @result = JSON.parse(json)
       @result = @result["result"]
     
  end

  private

  def ingredient_params
    params.require
      permit(:list )
  end
end
