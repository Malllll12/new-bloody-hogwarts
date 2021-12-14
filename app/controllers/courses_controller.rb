class CoursesController < ApplicationController
  def index
    @courses = Course.in_alphabetical_order
  end
end
