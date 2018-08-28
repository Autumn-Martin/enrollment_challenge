require 'rails_helper'

describe 'User sees one student' do
  describe 'when user links from student index' do
    it 'displays info for one student' do
      student_1 = Student.create(name: "Ada")
      student_2 = Student.create(name: "Zeke")
      visit students_path

      click_link student_1.name

      expect(page).to have_content(student_1.name)
      expect(page).to_not have_content(student_2.name)
    end
  end
end
