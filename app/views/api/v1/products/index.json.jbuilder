json.data @products do |product|
  json.(product, :id, :code, :name, :description, :price)
end