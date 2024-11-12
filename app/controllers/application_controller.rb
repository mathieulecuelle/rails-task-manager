class ApplicationController < ActionController::Base
  before_action :set_task, only: [:display, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def display
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to index_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

    def task_params
      params.require(:task).permit(:title, :details, :completed)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
