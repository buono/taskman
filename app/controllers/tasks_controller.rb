class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録したよ"
  end

  def show
  end

  def new
    #@はインスタンス変数なのでビューからも見れる
    @task = Task.new
  end

  def edit
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
