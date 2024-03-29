require 'spec_helper'

describe "User pages" do
  
  subject { page }
  
  shared_examples_for "all user pages" do
    it { should have_selector('h2',    text: heading) }
    it { should have_selector('title', text: page_title) }
  end
  
  describe "index" do
    
    let(:user) { FactoryGirl.create(:user) }
    
    before do
      sign_in user
      visit users_path
    end 
    
    it { should have_selector('title', text: 'All users') }
    
    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
        visit users_path
      end
      
      it { should have_link('ASP') }
    end
    
    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }
      
      let(:first_page)   { User.paginate(page: 1) }
      let(:second_page)  { User.paginate(page: 2) }
      
      it { should have_link('Next') }
      it { should have_link('2') }
      it { should_not have_link('delete') }
      
      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path 
        end
        
        it { should have_link('delete', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect { click_link('delete') }.to change(User, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin)) }
        
        # describe "self deletion" do
        #   before { delete :destroy(admin) }
        #   it "should not be able to destroy itself" do
        #     expect { response.should change(User, :count).by(0) } # WORKING ON IT
        #   end
        # end
      end
      
      it "should list the first page of users" do
        first_page.each do |user|
          page.should have_selector('li', text: user.first_name)
        end
      end
      
      it "should not list the second page of users" do
        second_page.each do |user|
          page.should_not have_selector('li', text: user.first_name)
        end
      end
      
      it "should list each user" do
        User.all[0..2].each do |user|
          page.should have_selector('li', text: user.first_name)
        end
      end      
    end
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
        fill_in "Password confirmation",     with: "foobar"
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
  
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end
    before { visit edit_user_path(user) }

    describe "page" do 
      it { should have_selector('h2',    text: "Edit user") }
      it { should have_selector('title', text: "Edit user") }
    end

    describe "with invalid information" do
      let(:error) { '1 error prohibited this user from being saved' }
      before { click_button "Update" }

      it { should have_content(error) }
    end
    
    describe "with valid information" do
      let(:user)      { FactoryGirl.create(:user) }
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "First name",   with: new_name
        fill_in "Email",        with: new_email
        fill_in "Password",     with: user.password
        fill_in "Password confirmation", with: user.password
        click_button "Update"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.flash.success') }
      it { should have_link('Sign out', :href => signout_path) }
      specify { user.reload.first_name.should  == new_name }
      specify { user.reload.email.should == new_email }
    end
  end
end