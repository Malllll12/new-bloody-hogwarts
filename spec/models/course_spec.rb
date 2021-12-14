require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    describe '.student_count' do
      it "returns the number of enrolled students" do
        casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        hermione = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")

        potions = Course.create!(name: "Potions")
        spells = Course.create!(name: "Spells")

        potions.students << casseopia
        potions.students << hermione
        spells.students << hermione

        expect(potions.student_count).to eq(2)
        expect(spells.student_count).to eq(1)
      end
    end
  end

end
