class Resident < ApplicationRecord
  has_many :resident_courses
  has_many :courses, through: :resident_courses
  validates_presence_of :name, :occupation, :age

  def self.average_age
    average(:age).to_f.round(2)
  end
end
