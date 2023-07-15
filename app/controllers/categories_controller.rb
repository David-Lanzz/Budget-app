class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:entities).where(user_id: current_user.id)
    @total_prices = calculate_total_prices(@categories)
  end

  def show
    @category = Category.includes(:entities).find(params[:id])
    @entities = @category.entities
    @total_price = @entities.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    params[:category][:icon] = select_image(params[:category][:icon])
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to user_categories_path(@category), notice: 'Category created successfully'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def select_image(selected)
    case selected.downcase
    when 'education'
      'books.jpg'
    when 'adventure'
      'adventure.webp'
    when 'fantasy'
      'fantasy.jpg'
    when 'mystery'
      'mystery.jpg'
    when 'romance'
      'romance.jpg'
    when 'science'
      'science.jpg'
    when 'thriller'
      'thriller.jpg'
    else
      'default.jpg'
    end
  end

  def calculate_total_prices(categories)
    categories.map { |category| category.entities.sum(:amount) }
  end
end
