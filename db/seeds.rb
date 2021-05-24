# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(name: "Nick", job: "Engineer")
@task1 = Task.create(title: "New feature", description: "Displaying tasks!", due_date: Time.now)
@task2 = Task.create(title: "Newer feature", description: "Get to work!!!", due_date: "1996-12-19T16:39:57-08:00", status: "Complete")
@tags = @task1.tags.create(name: "new")
@user_task = UserTask.create(user_id: @user.id, task_id: @task1.id)
