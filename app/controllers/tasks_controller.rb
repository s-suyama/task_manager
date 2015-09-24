class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = get_task
  end

  def new
    @task = Task.new
  end

  def edit
    @task = get_task
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
    @task = get_task
    if @task.update!(task_params)
      redirect_to @task, notice: 'タスクを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @task = get_task
    @task.destroy
    redirect_to tasks_url
  end

  private

  def get_task
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :status_id,
      :priority_id,
      :project_id,
      :assign_user_id,
      :lock_version)
  end
end
