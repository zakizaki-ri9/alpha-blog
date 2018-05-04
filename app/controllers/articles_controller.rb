class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    # 5記事ずつ ページング処理
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    ## byebugによるコマンドラインデバッグ
    # debugger

    @article = Article.new(article_params)
    @article.user = User.first #Userの紐付け機能を実装するまでの暫定対処
    if @article.save
      # 記事の保存に成功
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      # 記事の保存に失敗
      render 'new'
    end
  end
  
  def update
    if @article.user.nil?
      @article.user = User.first #Userの紐付け機能を実装するまでの暫定対処
    end
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end