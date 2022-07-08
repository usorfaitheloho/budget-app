class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy]
    before_action :authenticate_user!
  
    def index
      @categories = Category.where(user: current_user)
    end
    
    def show
        @expenses = @category.exchanges.order(created_at: :desc)
      end

    def new
      @category = Category.new
    end
  
    def edit; end
  
    def create
      @category = Category.new(category_params)
      @category.user = current_user
  
      if @category.save
        flash[:success] = 'Category successfully created'
        redirect_to categories_path
      else
        flash[:error] = 'Something went wrong'
        render 'new'
      end
    end
  
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:name, :icon)
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
          flash[:success] = 'category was successfully deleted.'
          redirect_to categories_path
        else
          flash[:error] = 'Something went wrong'
          render :show
        end
      end
end
