class CitiesController < ApplicationController
	def show
		@city = City.find_by_name(params[:name])
	end
end
