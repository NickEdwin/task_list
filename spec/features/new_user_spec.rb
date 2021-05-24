require "rails_helper"

RSpec.describe "Create a new user", type: :feature do
  it "can add a new user" do
    visit "/users/new"

    expect(User.first).to eq(nil)

    expect(page).to have_content("Create a new user")

    fill_in :Name, with: "Nick"
    fill_in :Job, with: "Software Engineer"

    click_on "Submit"

    expect(current_path).to eq('/')

    user = User.last
    expect(user.name).to eq("Nick")
    expect(user.job).to eq("Software Engineer")
  end
end
