class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Venue.by_name
  end

  def new
    @category = Venue.new
  end

  def show
  end

  def edit
  end

  def create
    @category = Categorie.new(category_params)
    if @category.save
      flash[:success] = 'Categoria fue creado exitosamente'
      redirect_to admin_categories_url
    else
      flash[:warning] = @category.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Categoria fue actualizado exitosamente'
      redirect_to admin_categories_url
    else
      flash[:warning] = @categorie.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Categoria fue destruido exitosamente'
      redirect_to admin_categories_url
    else
      flash[:warning] = @category.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_venue
    @category = Category.find(params[:id])
  end

  def venue_params
    params.require(:category).permit(:name,
                                  :description)
  end
end