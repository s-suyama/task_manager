class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save!
      redirect_to @task, notice: 'タスクを作成しました。'
    else
      render :new
    end
  end

  def update
    if @task.update!(task_params)
      redirect_to @task, notice: 'タスクを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:tasks).permit(
        :title,
        :description,
        :status_id,
        :priority_id,
        :project_id,
        :assign_user_id,
        :lock_version)
    end
end
