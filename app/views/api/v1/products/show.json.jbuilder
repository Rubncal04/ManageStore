json.message 'Your product'
json.data do
  json.(@product, :id, :code, :name, :description, :price)
end