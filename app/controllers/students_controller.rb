class StudentsController < ApplicationController
  def index
    @students = Student.in_alphabetical_order
  end

  def show
    @student = Student.find(params[:id])
  end
end
