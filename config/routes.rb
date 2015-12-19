Rails.application.routes.draw do
  get "/invoices/:page" => "invoices#show"

  root  'invoices#show'
  
  match '*path' => redirect('/'), via: :get
end
