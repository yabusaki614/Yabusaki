class ArticlesController < ApplicationController
	before_action :set_article, only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!
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
    	if @article.save
    		redirect_to '/articles' #:action => index 
	    	#article_path(@article.id)
	    	#送信したらどっかに飛んで－　redirect_to
    	else
    		#書き込み失敗
    		render action: :new
    	end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		#showと一緒
	end

	def update
		if  @article.update(article_params)
    		redirect_to article_path(@article.id)
		else
			render action: :edit
		end
	end
	
	def destroy
    	@article.destroy
    	redirect_to articles_path
	end



	private
	def article_params
	  params.require(:article).permit(:title, :body, :author)
	end
	def set_article
      @article = Article.find(params[:id])
    end
end
