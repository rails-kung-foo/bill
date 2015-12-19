Rails.application.routes.draw do
  match '/bill',  to: 'invoices#show',  via: 'get' 

  root  'invoices#show'

  match '*path' => redirect('/'), via: :get
end
