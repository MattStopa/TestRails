class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: "test", password: "secret"
end