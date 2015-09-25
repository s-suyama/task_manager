require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#title' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(100) }
  end

  describe '#description' do
    it { should validate_length_of(:description).is_at_most(1000) }
  end

  describe '#status_id' do
    it { should validate_presence_of(:status_id) }
  end

  it 'titleとdescriptionとstatus_idが入っていれば、検証に成功すること' do
    task = Task.new(
        title: 'hoge',
        description: 'hogehoge',
        status_id: 1
    )
    expect(task).to be_valid
  end

  it 'titleとdescriptionとstatus_idが入っていれば、登録に成功すること' do
    task = create(:task)
    expect(task.save!).to be_truthy
  end

  it 'titleとdescriptionのみでは、検証に失敗し、登録に失敗すること' do
    task = Task.new(
        title: 'hoge',
        description: 'hogehoge'
    )
    expect{task.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
