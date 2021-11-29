class LoginsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]
  
  def new
    
  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)

    if student && student.authenticate(params[:logins][:password]) 
      flash[:notice] = "You have successfully logged in"
      session[:student_id] = student.id
      redirect_to student
    
    else
      flash.now[:alert] = "Something wrong in your details"
    end

  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have succesfully logged out"
    redirect_to root_path
  end

end