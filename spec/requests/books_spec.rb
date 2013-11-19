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
	end
end
