class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    params[:task][:users].reject(&:empty?).each do |user|
      user_task = UserTask.new(user_id: user, task_id: @task.id)
      user_task.save
    end
    redirect_to "/"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :tag_list, :users)
  end
end
