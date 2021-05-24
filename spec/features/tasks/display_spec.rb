require "rails_helper"

RSpec.describe "Task display", type: :feature do
  it "Displays text to add a task if none" do
    visit "/"

    expect(page).to have_content("There are currently no tasks in the system.")
  end

  it "Displays tasks if they are in the system" do
    @user = User.create(name: "Nick", job: "Engineer")
    @task = Task.create(title: "New feature", description: "Displaying tasks!", due_date: Time.now)
    @tags = @task.tags.create(name: "new")
    @user_task = UserTask.create(user_id: @user.id, task_id: @task.id)

    visit "/"

    expect(page).to_not have_content("There are currently no tasks in the system.")

    within(".task-#{@task.id}") do
      expect(page).to have_content(@task.title)
    end
  end
end
