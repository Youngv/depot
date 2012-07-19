class StoreController < ApplicationController
	def index
		@cart = current_cart
		@products = Product.order(:title)
		
		@counter = session[:counter]
    	@counter.nil? ? @counter = 1 : @counter+=1
    	session[:counter] = @counter
	end
end
