require 'rails_helper'

RSpec.describe 'Student Index' do
#   As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")

  it "shows a list of students and their info" do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    hermione = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")

    visit "/students"

    within "#student-#{hermione.id}" do
      expect(page). to have_content(hermione.name)
      expect(page). to have_content(hermione.age)
      expect(page). to have_content(hermione.house)
    end
  end

  it 'shows average age of students' do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    hermione = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")

    visit '/students'

    expect(page).to have_content(Student.average_age)
  end
end
