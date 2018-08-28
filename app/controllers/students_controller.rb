class StudentsController < ApplicationController
  before_action :set_student, only: [:delete, :edit, :update]
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      flash[:success] = "#{@student.name} added!"
    redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student.update(student_params)

    redirect_to student_path(@student)
  end


  def destroy
    Student.destroy(params[:id])
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
