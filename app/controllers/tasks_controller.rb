class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @tasks = Task.all
    if @task.save
    redirect_to tasks_path
    else
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
    
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
    redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :body)
  end

end
