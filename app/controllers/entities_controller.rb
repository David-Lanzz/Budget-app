class EntitiesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @entity = Entity.new(category: @category)
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @entity = @category.entities.build(entity_params)
    @entity.user = current_user

    if @entity.save
      redirect_to user_category_path(user_id: current_user.id, id: @category.id), notice: 'Entity created successfully'
    else
      puts @entity.errors.inspect
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :category_id)
  end
end
