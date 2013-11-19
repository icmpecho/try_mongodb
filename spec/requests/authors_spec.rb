require 'spec_helper'

describe "Authors" do
	describe 'index page' do
		test = nil
		before {
			test = FactoryGirl.create(:author)
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
		it 'have delete button that can delete author' do
			within("\#edit_author_#{test.id}") do
				click_button "delete"
			end
			expect(page).to have_content('Authors')
			expect(page).not_to have_content('Test')
		end
	end
	describe 'new page' do
		before {
			visit new_author_path
		}
		it 'land on correct page' do
			expect(page).to have_content('New Author')
		end
		it 'can create user and redirect to index' do
			fill_in 'Name', with: 'Foo'
			click_button 'Create'
			expect(page).to have_content('Authors')
			expect(page).to have_content('Foo')
		end
		it 'cannot create duplicate author and redirect to new' do
			FactoryGirl.create(:author, name: 'Foo')
			fill_in 'Name', with: 'Foo'
			click_button 'Create'
			expect(page).to have_content('New Author')
		end
	end
end
