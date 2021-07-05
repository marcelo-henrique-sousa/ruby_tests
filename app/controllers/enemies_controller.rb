class EnemiesController < ApplicationController
  before_action :set_enemy

  def update
    if @enemy.update(permitted_params)
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @enemy.destroy
    head 204
  end
  
  private
  
  def set_enemy
    @enemy = Enemy.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end

  def permitted_params
    params.permit(:name, :power_base, :power_step, :level, :kind)
  end
end