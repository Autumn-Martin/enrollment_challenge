require 'rails_helper'

describe 'User creates a student' do
  describe 'they visit /students/new' do
    describe 'they fill in name and click submit' do
      it 'creates a student' do
        visit new_student_path

        fill_in 'student[name]', with: "Leia"
        click_on "Create Student"

        expect(current_path).to eq(student_path(Student.last))
        expect(page).to have_content("Leia")
      end
    end
  end
end
