require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #new' do
    before {get :new}

    it 'ステータスコードとして200が返ること' do
      expect(response.status).to eq(200)
    end

    it '@taskに、新規Taskオブジェクトが格納されていること' do
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'newテンプレートをrenderしていること' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it 'showテンプレートをrenderしていること' do
      task = create(:foo_bar)
      get :show, id: task
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it 'editテンプレートをrenderしていること' do
      task = create(:foo_bar)
      get :edit, id: task
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    it 'DBに新規のタスクが登録されること' do
      expect{
        post :create, task: attributes_for(:foo_bar)
      }.to change(Task, :count).by(1)
    end

    it '表示画面へリダイレクトすること' do
      post :create, task: attributes_for(:foo_bar)
      expect(response).to redirect_to assigns(:task)
    end

    it '検証に失敗する入力値の場合、newテンプレートをrenderすること' do
      post :create, task: attributes_for(:valid_error)
      expect(response).to render_template :new
    end
  end

  describe 'PATCH #update' do
    it '入力したパラメータで正しく更新されること' do
      task = create(:foo_bar)
      patch :update, id: task, task: attributes_for(:foo_bar,
                                                    title: 'hoge',
                                                    description: 'hogehoge',
                                                    status_id: 2,
                                                    priority_id: 2,
                                                    project_id: 2,
                                                    assign_user_id:2
                   )
      task.reload
      expect(task.title).to eq('hoge')
      expect(task.description).to eq('hogehoge')
      expect(task.status_id).to eq(2)
      expect(task.priority_id).to eq(2)
      expect(task.project_id).to eq(2)
      expect(task.assign_user_id).to eq(2)
    end
  end

  describe 'DELETE #destroy' do
    it 'DBから削除されること' do
      task = create(:foo_bar)
      expect{
        delete :destroy, id: task
      }.to change(Task, :count).by(-1)
    end
  end

  describe 'PATCH #update_status' do
    before :each do
      @task1 = create(:untouched_task)
      @task2 = create(:untouched_task)
      @task3 = create(:untouched_task)
      patch :update_status, { task: { status: Settings.status[:progress] }, checked_tasks: { @task1.id => '1', @task2.id => '0', @task3.id => '1' }}
    end

    it '複数のタスクのステータスが正しく更新されること' do
      @task1.reload
      @task2.reload
      @task3.reload
      expect(@task1.status_id).to eq(Settings.status[:progress])
      expect(@task2.status_id).to eq(Settings.status[:untouched])
      expect(@task3.status_id).to eq(Settings.status[:progress])
    end

    it '一覧画面へリダイレクトすること' do
      expect(response).to redirect_to tasks_url
    end
  end
end
