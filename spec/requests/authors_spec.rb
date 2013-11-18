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
		it 'have link to author pages' do
			click_link 'Foo'
			expect(page).to have_content('name: Foo')
		end
	end

end
