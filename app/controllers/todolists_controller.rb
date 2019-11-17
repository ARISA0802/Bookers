class TodolistsController < ApplicationController
  def new
  	@book = Book.new
  end

  def create
        # ストロングパラメーターを使用
         book = Book.new(book_params)
        # DBへ保存する
         book.save
        # トップ画面へリダイレクト
        redirect_to '/top'
    end

    def show
    	@book = Book.find(params[:id])
    end

    private
   
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
