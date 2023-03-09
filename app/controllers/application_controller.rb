require 'pry'
class ApplicationController < Sinatra::Base
  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all
    sorted_baked_goods = baked_goods.sort_by{|baked_good| -baked_good[:price]}
    sorted_baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all
    most_expensive_good = baked_goods.max_by{|good| good[:price]}
    most_expensive_good.to_json
  end
end
