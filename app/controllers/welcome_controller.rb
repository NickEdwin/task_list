class WelcomeController < ApplicationController
  def index
    if params[:sort] == "due_date"
      @tasks = Task.order('due_date ASC')
    elsif params[:sort] == "incomplete"
      @tasks = Task.where(status: "Incomplete")
    elsif params[:sort] == "complete"
      @tasks = Task.where(status: "Complete")
    elsif params[:sort] == "due_today"
      @tasks = Task.where("DATE(due_date) = ?", Date.today)
    else
    @tasks = Task.all
    end
  end
end
