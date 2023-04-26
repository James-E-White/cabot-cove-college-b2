require 'rails_helper'
# User Story 1 of 4

# As a visitor,
# When I visit '/residents',
# I see a list of residents with the following information:
# - Name
# - Age
# - Occupation
# (e.g. "Name: Jessica Fletcher, Age: 65, Occupation: Mystery writer", 
#       "Name: Dr. Seth Hazlitt, Age: 70, Occupation: Town Doctor")
RSpec.describe 'resident index' do
  describe 'as a visitor' do 
    before :each do
     @res_1 = Resident.create!(name: 'AWWWW Biscuits', age: 35, occupation: 'Coder Vet Tech Badass')
     @res_2 = Resident.create!(name: 'Chainsaw!!!!', age: 35, occupation: 'Hat Tricking Code Genius')
     @res_3 = Resident.create!(name: 'Spencer4hire', age: 35, occupation: 'Project manager wizard!')
     @res_4 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
     @res_5 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
    end
     describe ' when I visit /residents' do 
      it ' I see a list of residents with their name, age, and occupation' do 

        visit '/residents'
        
        expect(page).to have_content("Residents Index")
        expect(page).to have_content("Jessica Fletcher")
        expect(page).to have_content(@res_2.name)
        expect(page).to have_content(@res_1.age)
        expect(page).to have_content(@res_2.age)
        expect(page).to have_content(@res_1.occupation)
        expect(page).to have_content(@res_2.occupation)
       
      end
     end
# As a visitor,
# When I visit '/residents'
# I see the average age of all residents.

# (e.g. "Average Age: 72.5")
     describe 'when I visit /residents I see the average age of all the residents' do 
      it 'has the average age of the residents on the page' do 
        visit '/residents'
        save_and_open_page
        expect(page).to have_content("Average Resident Age: 48.0")
      end
     end
   end
end



