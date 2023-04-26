require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end
  
  it 'calculates the average age of all residents rounded to tenth' do
    @annie = Resident.create!(name: 'Annie', age: 14, occupation: 'Writer')
    @micheal = Resident.create!(name: 'Michael', age: 24, occupation: 'Student')
    @spencer = Resident.create!(name: 'Spencer', age: 30, occupation: 'Manager')

    expect(Resident.average_age).to eq(22.67) 

    @james = Resident.create!(name: 'James', age: 44, occupation: 'Student')

    expect(Resident.average_age).to eq(28.0) 
  end
end
