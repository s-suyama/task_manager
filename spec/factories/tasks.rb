# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title 'hoge'
    description 'hogehoge'
    status_id 1
  end

  factory :foo_bar, class: Task do
    title 'foo'
    description 'bar'
    status_id 1
    priority_id 1
    project_id 1
    assign_user_id 1
  end

  factory :valid_error, class: Task do
    title 'foo'
  end
end
