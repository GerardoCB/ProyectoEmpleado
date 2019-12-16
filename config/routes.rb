Rails.application.routes.draw do
  resources :empleados

  get :'/pagina_error', to: "documents#pagina_error"

  get :reporte_pdf, to: "documents#reporte_pdf"
  root  "empleados#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
