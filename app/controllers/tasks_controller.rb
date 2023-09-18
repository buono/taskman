class TasksController < ApplicationController
  def index
    #@q = current_user.tasks.ransack(params[:q])
    #@tasks = @q.result(distinct: true).recent
    @tasks = current_user.tasks
    #@tasks = Task.all
  end

  def create
    @task = current_user.tasks.new(task_params)
    #@task = Task.new(task_params)
    if params[:back].present?
      render :new
      return
    end

    if @task.save
      TaskMailer.creation_email(@task).deliver_now
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました"
    else
      render :new
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
    #@task = Task.find(params[:id])
  end

  def new
    #@はインスタンス変数なのでビューからも見れる
    @task = Task.new
  end

  def edit
    #@task = Task.current_user.tasks.find(params[:id])
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    #task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新したよ"
  end

  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    #task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しまっした"
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
