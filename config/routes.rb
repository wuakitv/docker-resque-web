require 'resque_web'

Rails.application.routes.draw do
  mount ResqueWeb::Engine => '/'
end
