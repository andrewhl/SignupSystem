require 'spec_helper'

describe "User pages" do
  
  subject { page }
  
  shared_examples_for "all user pages" do
    it { should have_selector('h2',    text: heading) }
    it { should have_selector('title', text: page_title) }
  end
  
  describe "signup page" do
    before { visit signup_path }
    
    let(:heading)     { 'Sign up' }
    let(:page_title)  { 'Sign up' }
    
    it_should_behave_like "all user pages"
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('h2', text: user.first_name) }
    it { should have_selector('title', text: user.first_name) }
  end
  
  describe "signup" do
    
    before { visit signup_path }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Sign up" }.not_to change(User, :count)
      end      
    end
  
    describe "with valid information" do
      before do
        fill_in "First name",       with: "Example"
        fill_in "Last name",        with: "User"
        fill_in "Email",            with: "sample@example.com"
        fill_in "Password",         with: "foobar"
        fill_in "Confirmation",     with: "foobar"
      end
      
      describe "after saving the user" do
        before { click_button "Sign up" }
        let(:user) { User.find_by_email('sample@example.com') }
        
        it { should have_selector('title', text: user.first_name) }
        it { should have_selector('div.flash.success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end
      
      it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count)
      end 
    end
    
    describe "error messages" do
      before { click_button "Sign up" }
      
      let(:error) { 'errors prohibited this user from being saved' }
      it { should have_selector('title', text: 'Sign up') }
      it { should have_content(error) }
    end
    
  end
end