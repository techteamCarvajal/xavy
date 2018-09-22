class Admin::VenuesController < Admin::ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.by_name
  end

  def new
    @venue = Venue.new
  end

  def show
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash[:success] = 'Centro fue creado exitosamente'
      redirect_to admin_venues_url
    else
      flash[:warning] = @venue.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      flash[:success] = 'Centro fue actualizado exitosamente'
      redirect_to admin_venues_url
    else
      flash[:warning] = @venue.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @venue.destroy
      flash[:success] = 'Centro fue destruido exitosamente'
      redirect_to admin_venues_url
    else
      flash[:warning] = @venue.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name,
                                  :description,
                                  :phone,
                                  :image)
  end
end
