class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end 

  get '/baked_goods/by_price' do
    bgoods = BakedGood.all.order(:price).reverse
    bgoods.to_json
  end

  get '/baked_goods/most_expensive' do
    pricy = BakedGood.all.max_by {|good| good[:price]}
    pricy.to_json
  end

end
