class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: "test", password: "%23g@3g32323225232323g24g54g4g2sdf@@#@#^"
end