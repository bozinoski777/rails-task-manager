class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(strong_task_params)
    @task.save
  end

  def new
    @task = Task.new
  end

  private

  def strong_task_params
    params.require(:task).permit(:title, :details)
  end
end
