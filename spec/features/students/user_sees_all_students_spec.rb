require 'rails_helper'

describe 'user sees all students' do
  describe 'they visit /students' do
    it 'displays all students' do
      student_1 = Student.new(name: "Ada")
      student_2 = Student.new(name: "Zeke")

      visit students_path

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
  end
end 
