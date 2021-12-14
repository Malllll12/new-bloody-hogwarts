require 'rails_helper'

RSpec.describe 'Student Show' do
#   As a visitor,
# When I visit '/students/:id'
# I see a list of the students' courses.
#
# (e.g. "Defense against the Dark Arts"
#       "Herbology"
#       "Potions")

  it "shows the students courses" do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")

    potions = casseopia.courses.create!(name: "Potions")
    spells = casseopia.courses.create!(name: "Spells")

    visit "/students/#{casseopia.id}"

    expect(page).to have_content(potions.name)
    expect(page).to have_content(spells.name)
  end
end
