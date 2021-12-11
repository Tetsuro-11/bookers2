class FavoritesController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.new(book_id: book.id)
        favorite.save
        redirect_to book_path(book)
    end
    
    def destroy
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
        select_redirect(book)
    end
    
    private
    def select_redirect(book)
        case params[:view]
        when "0"
            redirect_to books_path(book)
        when "1"
            redirect_to book_path(book)
        end
    end
end
