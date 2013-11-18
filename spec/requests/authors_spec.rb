require 'spec_helper'

describe "Authors" do
	describe 'index page' do
		before {
			FactoryGirl.create(:author)
			FactoryGirl.create(:author, name: 'Foo')
			visit '/authors'
		}
		it 'land on correct page' do
			expect(page).to have_content('Authors')
			expect(page).to have_content('Test')
			expect(page).to have_content('Foo')
		end
	end

end
