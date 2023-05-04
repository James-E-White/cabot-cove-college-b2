require 'rails_helper'

# User Story 3 of 4
# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of residents enrolled in each course.

# (e.g. "Crime Scenes 101: 5"
#       "Fingerprinting: 10")

RSpec.describe 'Courses Index page do' do
  describe 'as a user when I visit courses' do
    before :each do
      @res_1 = Resident.create!(name: 'AWWWW Biscuits', age: 35, occupation: 'Coder Vet Tech Badass')
      @res_2 = Resident.create!(name: 'Chainsaw!!!!', age: 35, occupation: 'Hat Tricking Code Genius')
      @res_3 = Resident.create!(name: 'Spencer4hire', age: 35, occupation: 'Project manager wizard!')
      @res_4 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
      @res_5 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
      @crime = Course.create!(name: 'Crime Scenes 101')
      @print = Course.create!(name: 'Fingerprinting')
      @tox = Course.create!(name: 'Toxicology')
      @course_1 = ResidentCourse.create!(resident_id: @res_1.id, course_id: @crime.id)
      @course_2 = ResidentCourse.create!(resident_id: @res_1.id, course_id: @print.id)
      @course_3 = ResidentCourse.create!(resident_id: @res_2.id, course_id: @tox.id)
      @course_4 = ResidentCourse.create!(resident_id: @res_2.id, course_id: @print.id)
      @course_5 = ResidentCourse.create!(resident_id: @res_3.id, course_id: @tox.id)
      @course_6 = ResidentCourse.create!(resident_id: @res_3.id, course_id: @print.id)
      @course_7 = ResidentCourse.create!(resident_id: @res_4.id, course_id: @crime.id)
      @course_8 = ResidentCourse.create!(resident_id: @res_5.id, course_id: @crime.id)
    end

    it 'shows all the courses and the number of residents in each one' do
      visit '/courses'

      expect(page).to have_content(@crime.name)
      expect(page).to have_content(@print.name)
      expect(page).to have_content(@tox.name)
    end
    it 'shows all the courses and the number of residents enrolled' do
      visit '/courses'
      within "#course_#{@crime.id}" do
        expect(page).to have_content('Residents Enrolled: 3')
      end
      within "#course_#{@print.id}" do
        expect(page).to have_content('Residents Enrolled: 3')
      end
      within "#course_#{@tox.id}" do
        expect(page).to have_content('Residents Enrolled: 2')
       
      end
    end

    describe 'sort_alpha' do
      it 'sorts courses alphabetically' do
        visit '/courses'

        expect('Crime Scenes 101').to appear_before('Fingerprinting')
        expect('Fingerprinting').to_not appear_before('Crime Scenes 101')
        expect('Fingerprinting').to appear_before('Toxicology')
      end
    end
  end
end
