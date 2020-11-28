class ToppagesController < ApplicationController
  def index
    #app/views/layouts/toppage_layout.html.erb のレイアウトを読み込む
    render :layout => "toppage_layout" 
  end
end
