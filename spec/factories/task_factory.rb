FactoryGirl.define do
  factory :task do
    title "Example task"
    content "Task example"
    comments "MyString"
    status "MyString"
    start_date "MyString"
    due_date "MyString"
    estimation "MyString"
    project nil
  end
end
