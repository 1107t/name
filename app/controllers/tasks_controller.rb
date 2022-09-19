class TasksController < ApplicationController
  
  
  
  def index
    @user = User.find(params[:user_id])
    @tasks = Task.all
  end
  
  def create
       @task = Task.new(tasks_params)
       @task.user_id = current_user.id
    if @task.save
       flash[:success] = "新規作成しました。"
       redirect_to user_tasks_url
    else 
       render :new
    end   
  end
  
  def new
    @task = Task.new
  end 
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
     @task = Task.find(params[:id])
     if @task.update_attributes(tasks_params)
      flash[:success] = "更新に成功しました。"
      redirect_to user_task_url
     else
      render :edit
     end  
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "削除に成功しました。"
    redirect_to user_tasks_url
  end
  
  def tasks_params
    params.require(:task).permit(:name,:description)
  end
  
end


