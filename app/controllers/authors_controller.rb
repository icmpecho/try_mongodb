class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end
	def show
		@author = Author.find_by(id: params[:id]);
	end
	def create
		@author = Author.new( author_params )
		if @author.save
			redirect_to authors_path
		else
			redirect_to new_author_path
		end
	end
	def new
		@author = Author.new
	end

	private
		def author_params
			params.require(:author).permit(:name)
		end
end
