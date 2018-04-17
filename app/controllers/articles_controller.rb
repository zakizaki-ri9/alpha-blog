class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      # 記事の保存に成功
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      # 記事の保存に失敗
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end