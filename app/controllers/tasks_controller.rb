class TasksController < ApplicationController

  # 全タスクを取得し、タスク一覧画面の html を返します。
  def index
    @tasks = Task.all
  end

  # 指定した id のタスクを取得し、タスクの表示画面の html を返します。
  def show
    @task = get_task
  end

  # 新しいタスクのインスタンを生成し、タスクの登録画面の html を返します。
  def new
    @task = Task.new
  end

  # 指定した id のタスクを取得し、タスクの編集画面の html を返します。
  def edit
    @task = get_task
  end

  # 新しいタスクを登録します。
  # タスクの登録に成功した場合、タスクの表示画面へリダイレクトします。
  # タスクの登録に失敗した場合、タスクの登録画面の html を返します。
  def create
    @task = Task.new(task_params)

    unless @task.valid?
      render :new
      return
    end

    if @task.save!
      redirect_to @task, notice: 'タスクを作成しました。'
    else
      render :new
    end
  end

  # 指定した id のタスクを更新します。
  def update
    @task = get_task
    @task.attributes = task_params

    unless @task.valid?
      render :edit
      return
    end

    if @task.update!(task_params)
      redirect_to @task, notice: 'タスクを更新しました。'
    else
      render :edit
    end
  end

  # 指定した id のタスクを削除します。
  def destroy
    @task = get_task
    @task.destroy
    redirect_to tasks_url
  end

  private

  # url で指定した id のタスクを取得します。
  # @return [Task] 指定した id のタスク
  def get_task
    Task.find(params[:id])
  end

  # 画面で入力したパラメータのハッシュを取得します。
  # @return [Hash] 画面で入力したパラメータ
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
