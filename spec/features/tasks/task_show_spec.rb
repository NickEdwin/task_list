require "rails_helper"

RSpec.describe "Task show page", type: :feature do
  before(:each) do
    @user = User.create(name: "Nick", job: "Engineer")
    @task1 = Task.create(title: "New feature", description: "Displaying tasks!", due_date: Time.now)
    @task2 = Task.create(title: "Newer feature", description: "Get to work!!!", due_date: "1996-12-19T16:39:57-08:00", status: "Complete")
    @tags = @task1.tags.create(name: "new")
    @user_task = UserTask.create(user_id: @user.id, task_id: @task1.id)
  end

  it "Displays a single tasks show page" do
    visit "/tasks/#{@task1.id}"

    expect(page).to have_content("New feature")
    expect(page).to have_content("Displaying tasks!",)
  end

  it "redirects if task does not exist" do
    visit "/tasks/10000000"

    expect(current_path).to eq("/")
  end

  it "can delete a task" do
    visit "/tasks/#{@task1.id}"

    click_on "Delete Task"

    expect(Task.first.id).to eq(@task2.id)
  end

  it "can edit a task" do
    visit "/tasks/#{@task1.id}"

    click_on "Edit Task"

    expect(current_path).to eq("/tasks/#{@task1.id}/edit")

    click_on "Update Task"

    expect(current_path).to eq("/")
  end

  it "can edit a tasks status" do
    visit "/tasks/#{@task1.id}"

    expect(@task1.status).to eq("Incomplete")
    click_on "Mark Complete"

    expect(Task.first.status).to eq("Complete")
  end

  it "can sort tasks by due date" do
    visit "/"

    within all(".col-sm-6")[1] do
      expect(".task-#{@task1.id}").to eq(".task-#{@task1.id}")
    end

    click_on "Due First"

    within all(".col-sm-6")[1] do
      expect(".task-#{@task2.id}").to eq(".task-#{@task2.id}")
    end
  end

  it "can sort tasks by due today" do
    visit "/"

    click_on "Due Today"

    within(".col-sm-6") do
      expect(".task-#{@task1.id}").to eq(".task-#{@task1.id}")
    end
  end

  it "can sort tasks by Incomplete" do
    visit "/"

    click_on "Incomplete"

    within(".col-sm-6") do
      expect(".task-#{@task1.id}").to eq(".task-#{@task1.id}")
    end
  end

  it "can sort tasks by Complete" do
    visit "/"

    click_on "Complete"

    within(".col-sm-6") do
      expect(".task-#{@task2.id}").to eq(".task-#{@task2.id}")
    end
  end
end
