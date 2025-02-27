require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

    before :each do 
     @res_1 = Resident.create!(name: 'AWWWW Biscuits', age: 35, occupation: 'Coder Vet Tech Badass')
     @res_2 = Resident.create!(name: 'Chainsaw!!!!', age: 35, occupation: 'Hat Tricking Code Genius')
     @res_3 = Resident.create!(name: 'Spencer4hire', age: 35, occupation: 'Project manager wizard!')
     @res_4 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
     @res_5 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
     @crime = Course.create!(name: "Crime Scenes 101")
     @print = Course.create!(name: "Fingerprinting")
     @tox = Course.create!(name: "Toxicology")
     @course_1 = ResidentCourse.create!(resident_id: @res_1.id, course_id: @crime.id)
     @course_2 = ResidentCourse.create!(resident_id: @res_1.id, course_id: @print.id)
     @course_3 = ResidentCourse.create!(resident_id: @res_2.id, course_id: @tox.id)
     @course_4 = ResidentCourse.create!(resident_id: @res_2.id, course_id: @print.id)
     @course_5 = ResidentCourse.create!(resident_id: @res_3.id, course_id: @tox.id)
     @course_6 = ResidentCourse.create!(resident_id: @res_3.id, course_id: @print.id)
     @course_7 = ResidentCourse.create!(resident_id: @res_4.id, course_id: @crime.id)
     @course_8 = ResidentCourse.create!(resident_id: @res_5.id, course_id: @crime.id)
    
    end

    it 'shows all the courses and the number of residents enrolled' do 
   
     expect(@crime.enrollment_count).to eq(3)
     expect(@print.enrollment_count).to eq(3)
     expect(@tox.enrollment_count).to eq(2)
     
   end

end
