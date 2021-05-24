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

  def show
    @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to "/"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to "/"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to "/"
  end

  def status
    @task = Task.find(params[:id])
    @task.status = "Complete"
    @task.save
    redirect_to "/tasks/#{@task.id}"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :tag_list, :users)
  end
end
