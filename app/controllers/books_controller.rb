class BooksController < ApplicationController
before_filter :authenticate_user!

	def index
		puts "~~~~~~~~~~~"
		@all_books = current_user.books
	end
end
