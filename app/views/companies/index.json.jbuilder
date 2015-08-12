json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :logo, :email, :adress, :telephone, :host
  json.url company_url(company, format: :json)
end
