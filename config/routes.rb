# Rails.application.routes.draw do
#   get 'string_calculator#index'
#   root 'calculations#index'

#   # root 'calculations#index'  # Set the root route to the calculation form
#   # get 'calculations', to: 'calculations#index
# end

Rails.application.routes.draw do
  root 'string_calculator#index'  # Set the root route to the calculation form
  get 'string_calculator', to: 'string_calculator#index'
end