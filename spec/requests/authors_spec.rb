require 'spec_helper'

describe "Authors" do
	subject { page }
	describe 'index page' do
		before {
			FactoryGirl.create(:author)
			FactoryGirl.create(:author, name: 'Foo')
			visit '/authors'
		}
		it { should have_content('Authors') }
		it { should have_content('Test') }
		it { should have_content('Foo') }
	end
end
