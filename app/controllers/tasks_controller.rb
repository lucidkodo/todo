class TasksController < ApplicationController
	before_action :signed_in

	def index
		@undone_tasks = Task.where(:user_id => current_user.id, :status => false)
		@done_tasks = Task.where(:user_id => current_user.id, :status => true)
		@new_task = current_user.tasks.new
	end

	def create
		@new_task = current_user.tasks.new(task_params)
		if @new_task.save
			flash[:success] = "New task added!"
		else
			flash[:warning] = nope
		end
		redirect_to root_path
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			flash[:info] = "Task updated!"
			redirect_to "tasks#show"
		else
			flash[:warning] = nope
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		flash[:info] = "Task removed."
		redirect_to root_path
	end


	private
	def task_params
		params.require(:task).permit(:content)
	end

	def signed_in
		redirect_to sign_in_path if current_user == nil
	end
end
