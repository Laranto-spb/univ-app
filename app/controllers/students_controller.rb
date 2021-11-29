class StudentsController < ApplicationController
  
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = "You signed up successfully"
      redirect_to students_path
    else
      render 'new'
    end
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "You updated your profile successfully"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end


  def edit
    
  end


  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_user 
    if current_user != @user
      flash[:alert] = "You can only edit your own profile"
      redirect_to student_path(current_user)
    end
  end
  
end