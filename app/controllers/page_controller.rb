class PageController < ApplicationController
  
  def home
    # ログインしている場合は記事一覧を表示
    redirect_to articles_path if logged_in?
  end
  
  def about
  end
end
