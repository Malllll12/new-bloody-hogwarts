class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates_presence_of :name, :age, :house

  def self.average_age
    average(:age)
  end

  def self.in_alphabetical_order
    order(:name)
  end
end
