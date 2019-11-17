class BooksController < ApplicationController
  def new
  	@book = Book.new
  end

  def create
    @books = Book.all 
    # ストロングパラメーターを使用
     @book = Book.new(book_params)
    # DBへ保存する
    if  @book.save
    # トップ画面へリダイレクト
    redirect_to book_path(@book.id), notice:"Book was successfully created."
    else
      render 'books/index'
   end
  end

    def index
         @books = Book.all 
         @book = Book.new
    end

    def show
        @book = Book.find(params[:id]) 
    end

    def edit
        @book = Book.find(params[:id])
        
    end

    def update
    	book = Book.find(params[:id])
        book.update(book_params)
        redirect_to book_path(book.id), notice:"Book was successfully created."
    end

    def destroy
    	book = Book.find(params[:id]) #データ(レコード)を1件取得
        book.destroy #データ（レコード）を削除
        redirect_to books_path #List一覧画面へリダイレクト
    end

    private
   
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
