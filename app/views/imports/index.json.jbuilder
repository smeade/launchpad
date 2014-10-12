json.array!(@imports) do |import|
  json.extract! import, :id, :name
  json.url import_url(import, format: :json)
end
