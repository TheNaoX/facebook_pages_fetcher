json.cache! @pages do
  json.partial! "page", collection: @pages, as: :page
end
