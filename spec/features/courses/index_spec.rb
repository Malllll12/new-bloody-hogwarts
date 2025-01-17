require 'rails_helper'

RSpec.describe 'Course Index' do
  # User Story 3 of 4
  # As a visitor,
  # When I visit '/courses'
  # I see a list of courses and the number of students enrolled in each course.
  #
  # (e.g. "Defense Against the Dark Arts: 5"
  #       "Herbology: 10"
  it 'shows courses and count of students' do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    hermione = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")

    potions = Course.create!(name: "Potions")
    spells = Course.create!(name: "Spells")

    potions.students << casseopia
    potions.students << hermione
    spells.students << hermione

    visit "/courses"

    within "#course-#{potions.id}" do
      expect(page).to have_content("#{potions.name}: #{potions.student_count}")
    end

    within "#course-#{spells.id}" do
      expect(page).to have_content("#{spells.name}: #{spells.student_count}")
    end
  end

  #   User Story Extension
  #
  # Students index page shows students in alphabetical order.
  # Courses index page shows courses in alphabetical order.
  # And the courses index page also shows students per course in alphabetical order.
  #
  # (e.g. "Defense Against the Dark Arts: 3"
  #       "- Elizabeth Burke"
  #       "- Phineas Black"
  #       "- Russell Lucky"

  it 'shows courses and students are in alphabetical order'  do
    hermione = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")

    potions = Course.create!(name: "Potions")
    spells = Course.create!(name: "Spells")

    potions.students << casseopia
    potions.students << hermione
    spells.students << hermione

    visit '/courses'

    within "#course-#{potions.id}"
    expect(casseopia.name).to appear_before(hermione.name)
  end

end
