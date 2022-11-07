class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
      bakeries = Bakery.find(params[:id])
      bakeries.to_json( include: {
      baked_goods: { only: [:name, :price]}})
  end

  get '/baked_goods/by_price' do
    "by price"
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

   get '/baked_goods/most_expensive' do
    "most expensive"
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.first.to_json
  end
end
