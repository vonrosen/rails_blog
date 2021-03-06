class ArticlesController < ApplicationController

  def helper_method(n)
    'a' * n
  end

  def beverlys_method
    helper_method(3)
  end

  def beverlys_method_no_helper
    puts 'no helper method called here'
  end

  def lulu(input)
    if input == 1
      true
    else
      false
    end
  end

  def calls_lulu(input)
    lulu(input) || 'monkeys!!!'
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
