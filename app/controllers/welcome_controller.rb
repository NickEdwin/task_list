class WelcomeController < ApplicationController
  def index
    if params[:sort] == "due_date"
      @tasks = Task.order('due_date ASC')
      if @tasks.empty? then @tasks = Task.all end
    elsif params[:sort] == "incomplete"
      @tasks = Task.where(status: "Incomplete")
      if @tasks.empty? then @tasks = Task.all end
    elsif params[:sort] == "complete"
      @tasks = Task.where(status: "Complete")
      if @tasks.empty? then @tasks = Task.all end
    elsif params[:sort] == "due_today"
      @tasks = Task.where("DATE(due_date) = ?", Date.today)
      if @tasks.empty? then @tasks = Task.all end
    elsif params[:search]
      search = params[:search].split(",").collect{|s| s.strip.downcase}.uniq.first
      @tasks = Task.where("LOWER(title) LIKE LOWER(?)", "%#{search}%")
      if @tasks.empty? then @tasks = Task.all end
    else
      @tasks = Task.all
    end
  end
end
