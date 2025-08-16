class Api::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /api/tasks
  def index
    @tasks = Task.active.order(created_at: :desc)
    render json: @tasks
  end

  # GET /api/tasks/:id
  def show
    render json: @task
  end

  # POST /api/tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/tasks/:id
  def destroy
    @task.soft_delete
    head :no_content
  end

  private

  def set_task
    @task = Task.active.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Task not found' }, status: :not_found
  end

  def task_params
    params.require(:task).permit(:name, :description, :is_completed)
  end
end 