class ArticlesController < ApplicationController
    # Articleモデルのfindメソッドを使用して、パラメータの値に一致するidのデータを検索している
    # 取得したデータを@articleというインスタンス変数にセットする
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  
  def new
    @article = Article.new
  end
  
  def create
  @article = Article.new(article_params)
  @article.save
  redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
  @article = Article.find(params[:id])
  @article.update(article_params)
  redirect_to @article
 end

 def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to @article
 end

  private

  def article_params
    params.require(:article).permit(:title,:body)
  end
end
