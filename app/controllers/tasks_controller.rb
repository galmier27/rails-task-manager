class TasksController < ApplicationController

  def list
    @tasks = Task.all
  end

  def read
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to list_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to list_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
