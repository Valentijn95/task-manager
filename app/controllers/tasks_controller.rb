class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task_template = Task.new()
  end

  def create
    task = Task.create(task_params)
    redirect_to :controller => 'tasks', :action => 'show', :id => task.id
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to :controller => 'tasks', :action => 'show', :id => task.id
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to :controller => 'tasks', :action => 'index'
  end

  def finish
    complete!(Task.find(params[:id]))
    redirect_to :controller => 'tasks', :action => 'index'
  end

  private

  def complete!(a_task)
    self.completed = true
    self.save
  end

  def task_params
    params[:task].permit(:title, :details)
  end
end
