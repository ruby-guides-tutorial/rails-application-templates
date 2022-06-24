class WelcomeController < ApplicationController
  include ActionController::MimeResponds

  def index
    @title =  "snake_api"
    @copyright = "copyright (c) 2021 guxiaobai <sikuan.gu@gmail.com>"
    respond_to :json, :html
  end
end