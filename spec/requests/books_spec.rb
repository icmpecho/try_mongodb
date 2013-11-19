require 'spec_helper'

describe "Books" do
	describe "index page" do
		before do
			FactoryGirl.create(:book, name: "Bar")
			FactoryGirl.create(:book, name: "Baz")
			visit books_path
		end
		it 'land on correct page' do
			expect(page).to have_content('Books')
			expect(page).to have_content('Bar')
			expect(page).to have_content('Baz')
		end
		it 'have link to book pages' do
			click_link 'Bar'
			expect(page).to have_content('name: Bar')
		end
		it 'have a link to create new book page' do
			click_link "Create new"
			expect(page).to have_content('New Book')
		end
	end
	describe 'new page' do
		before {
			visit new_book_path
		}
		it 'land on correct page' do
			expect(page).to have_content('New Book')
		end
		it 'can create book and redirect to index' do
			fill_in 'Name', with: 'Bar'
			click_button 'Create'
			expect(page).to have_content('Books')
			expect(page).to have_content('Bar')
		end
		it 'cannot create duplicate book and redirect to new' do
			FactoryGirl.create(:book, name: 'Foo')
			fill_in 'Name', with: 'Foo'
			click_button 'Create'
			expect(page).to have_content('New Book')
		end
	end
end
