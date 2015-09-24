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
end
