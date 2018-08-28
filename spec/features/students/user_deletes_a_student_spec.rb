require 'rails_helper'

describe 'User deletes a student' do
  describe 'user visits /students' do
    describe 'user clicks delete next to a students name' do
      it 'deletes a student' do
        student_1 = Student.create(name: "Ada")
        student_2 = Student.create(name: "Zeke")

        visit students_path

        within ("student-#{student_2.id}") do
          click_on "Delete"
        end

        expect(page).to_not have_content(student_2.name)
        expect(page).to have_content(student_1.name)
      end
    end
  end
end

# As a user
# When I visit `/students`
# And I click "Delete" next to a student's name
# I see the students index
# And that student's name is no longer on the page
# ```
