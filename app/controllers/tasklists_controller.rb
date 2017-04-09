class TasklistsController < ApplicationController
 before_action :require_user_logged_in
 before_action :correct_user, only: [:edit, :destroy]
 
  def create
    @tasklist = current_user.tasklists.build(tasklist_params)
    if @tasklist.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      redirect_to root_url
    end
  end
  
  def edit
    @tasklist = current_user.tasklists.find(params[:id])
  end
  
  def update
    @tasklist = current_user.tasklists.find(params[:id])
    if @tasklist.update(tasklist_params)
      flash[:success] = '正常に更新されました'
       redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  def destroy
    @tasklist.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def tasklist_params
    params.require(:tasklist).permit(:content)
  end

  def correct_user
    @tasklist = current_user.tasklists.find_by(id: params[:id])
    unless @tasklist
      redirect_to root_path
    end
  end
end
