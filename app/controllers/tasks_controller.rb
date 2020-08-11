class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def create
    @task = Task.new(strong_task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update(strong_task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def strong_task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
