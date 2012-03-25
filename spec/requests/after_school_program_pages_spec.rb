require 'spec_helper'

describe "After School Program Pages" do
  let(:admin) { FactoryGirl.create(:admin) }
  before do
    sign_in admin 
  end
  
  subject { page }
  
  shared_examples_for "all after school programs pages" do
    it { should have_selector('h2',    text: heading) }
    it { should have_selector('title', text: page_title) }
  end
  
  describe "index" do
    before { visit after_school_programs_path }
    
    let(:page_title)  { 'After School Programs' }
    let(:heading) { 'All programs' }
    
    it_should_behave_like "all after school programs pages"
    it { should have_link('Create Programs') }
    it { should have_link('View Programs') }
    it { should have_link('Edit Programs') }
  end
  
  describe "new" do
    before { visit new_after_school_program_path }
    
    let(:page_title)  { 'After School Programs Create Form' }
    let(:heading) { 'Create programs here' }
    
    it_should_behave_like "all after school programs pages"
    
  end
  
  describe "program creation" do
    
    before { visit new_after_school_program_path }
    
    # describe "with invalid information" do
    #   it "should not create a user" do
    #     expect { click_button "Create program" }.not_to change(User, :count)
    #   end      
    # end
  
    describe "with valid information" do
      before do
        fill_in "Program name",       with: "Sample Program"
        fill_in "Day",                with: "Monday"
        fill_in "Price",              with: "$60.00"
        fill_in "Status",             with: "Active"
        fill_in "Dates",              with: "May 1st"
        fill_in "Max registrants",    with: 10
      end
            
      it "should create a program" do
        expect { click_button "Create program" }.to change(AfterSchoolProgram, :count)
      end 
    end
    
  end
end
