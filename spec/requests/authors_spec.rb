require 'spec_helper'

describe "Authors" do
	subject { page }
  	describe 'index page' do
  		before { visit '/authors' }
  		it { should have_content('Authors') }
  	end
end
