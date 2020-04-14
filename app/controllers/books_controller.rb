class BooksController < ApplicationController
  def top
  end

  def index
  	@books=Book.all#全データ表示用
  	@book=Book.new#空のインスタンスを渡す（create用）
  end

  def show
  	@book=Book.find(params[:id])
  end

  def create
  	@book=Book.new(book_params)#book_paramsは値を渡しているのではなく、登録するのはtitle,bodyですよと教えているだけ
  	if @book.save
  		redirect_to book_path(@book.id),notice: "Book was successfully created."
  	else
  		@books=Book.all
        render action: :index
  	end
  end

  def edit
  	@book=Book.find(params[:id])
  end

  def update
  	book=Book.find(params[:id])#更新は、そのidに上書き処理
  	book.update(book_params)
  	redirect_to book_path(book),notice: "Book was successfully updated."
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path,notice: "Book was successfully destroyed."
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
