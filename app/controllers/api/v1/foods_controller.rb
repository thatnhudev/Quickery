class Api::V1::FoodsController < ApplicationController
  def index
    food = Food.all.order(name: :desc)
    render json: food
  end

  def create
    food = Food.create!(food_params)
    if food
      render json: food
    else
      render json: food.errors
    end
  end

  def show
    if food
      render json: food
    else
      render json: food.errors
    end
  end

  def destroy
    food&.destroy
    render json: { message: 'Food Item deleted!' }
  end

  private

  def food_params
    params.permit(:name, :image, :group, :type, :nutrition, :calories)
  end

  def food
    @food ||= Food.find(params[:id])
  end
end
