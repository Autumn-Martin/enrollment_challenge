# As a user
# When I visit `/students/:id/edit`
# And I enter a new name
# And I click submit
# I am on the student show page
# And I can see that student's new name
require 'rails_helper'

describe 'User visits /students/:id/edit' do
  describe 'user enters a name' do
    describe 'user clicks on submit' do
      it 'edits a student' do
        student = Student.create(name: "Ada")
        new_name = "Ada Lovelace"

        visit edit_student_path(student)

        click_on "Update Student"
        fill_in "student[name]", with: new_name

        expect(path).to eq(student_path(student))
        expect(page).to have_content(student.name)
      end
    end
  end
end
