require 'spec_helper'

describe "Pages" do
  before { visit pages_path }
  
  let(:base_title) { "Leo Baeck Signup System" }

  describe "Index page" do

    it "should have the content 'Welcome'" do
      page.should have_content('Welcome')
    end
    
    it "should have the right title" do
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
    
  end
end