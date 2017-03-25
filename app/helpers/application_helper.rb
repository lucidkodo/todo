module ApplicationHelper
	def current_user
		User.find(session[:user_id]) if session[:user_id] 
  end

  def page_title
    if current_user != nil
      "ToDo Diary | " + current_user.username
    else
      "ToDo Diary"
    end
  end

  def signed_in?
    true if current_user != nil
  end

  def task_status(task)
    if task.status == false
      return "Unsolve"
    else
      return "Solved!"
    end
  end 
  
  def mark_as_done(task)
    task = Task.find(params[:id])
    task.status = true
    task.save
  end

end
