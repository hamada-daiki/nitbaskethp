Rails.application.routes.draw do
  get "/article"  => "home#article"
  get "/about"    => "home#about"
  get "/schedule" => "home#schedule"
  get "/member"   => "home#member"
  get "/acssess"  => "home#acssess"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#top'
end
