class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@places = Place.all.order("created_at ASC").page(params[:page]).per(5)
	end

	def new
		@place = Place.new
	end

	def create
		@place = current_user.places.create(place_params)
		if @place.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def show
		@place = Place.find(params[:id])
		@comment = Comment.new
		@photo = Photo.new
	end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Sorry, not allowed in here!', :status => :forbidden
		end
	end

	def update
		@place = Place.find(params[:id])
		if @place.user != current_user
			return render :text => 'Dude, this isn\'t the place for you!', :status => :forbidden
		end

		@place.update_attributes(place_params)
		if @place.valid?
			redirect_to root_path
		else
			render :edit, :status => :unprocessable_entity
		end
	end

	def destroy
		@place = Place.find(params[:id])
		if @place.user != current_user
			return render :text => 'Yo, this isn\'t fit for your eyes, sorry!', :status => :forbidden
		end

		@place.destroy
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end
