class ArticlesController < ApplicationController
	def index
		#いっぱいデータが入っているよ　の　複数形
		@articles = Article.all
	end

	def new
		@article = Article.new
		#ダミー　新規投稿だと教えている
	end
	def create
		#これから使うものだよ～
		@article = Article.new(article_params)
		#@article = Article.create(article_params)でも出来る。その場合.saveはいらない
    	@article.save
    	redirect_to '/articles' #:action => index 
    #article_path(@article.id)
    	#送信したらどっかに飛んで－　redirect_to
	end
	def show
		@article = Article.find(params[:id])
	end
	#空の値を探す　→helperへ
	def search
    redirect_to :action => "new" if !search_validate
  	end

	private
	def article_params
	  params.require(:article).permit(:title, :body, :author)
	end
end
