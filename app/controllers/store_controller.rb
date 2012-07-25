class StoreController < ApplicationController
skip_before_filter :authorize
	def index
		if params[:set_locale]
      	  	redirect_to store_path(locale: params[:set_locale])
    	else
			@cart = current_cart
			@products = Product.find(:all, :conditions => {:locale => I18n.locale})
		end

		@counter = session[:counter]
    	@counter.nil? ? @counter = 1 : @counter+=1
    	session[:counter] = @counter
	end
end
