require 'spec_helper'

describe "Pages" do
  
  let(:base_title) { "Leo Baeck Signup System" }

  describe "Index page" do

    it "should have the content 'Welcome'" do
      visit pages_path
      page.should have_content('Welcome')
    end
    
    it "should have the right title" do
      visit pages_path
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
    
    it "should have test path" do
      visit '/pages/test'
    end
    
  end
end
