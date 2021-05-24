require "rails_helper"

RSpec.describe "Create a new task", type: :feature do
  before(:each) do
    @user = User.create(name: "Nick", job: "Engineer")
  end

  it "can add a new user" do
    visit "/tasks/new"

    expect(Task.first).to eq(nil)

    expect(page).to have_content("Create a new Task")

    fill_in :Title, with: "New Job!"
    fill_in :Description, with: "Make some stuff!"
    fill_in :Tag, with: "New, Important"
    select "Nick", :from => :Users

    click_on "Submit"

    expect(current_path).to eq('/')

    task1 = Task.first

    expect(task1.title).to eq("New Job!")
    expect(task1.users.first.name).to eq("Nick")
    expect(task1.tags.first.name).to eq("new")
  end
end
