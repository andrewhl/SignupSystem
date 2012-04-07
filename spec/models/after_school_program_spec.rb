require 'spec_helper'

describe AfterSchoolProgram do
  before do 
    @program = AfterSchoolProgram.new(program_name: "Sample Program", price: 10, status: "Active",
                     dates: "May 1st", max_registrants: 10)
  end
  
  subject { @program }
  
  it { should respond_to(:program_name) }
  it { should respond_to(:price) }
  it { should respond_to(:status) }
  it { should respond_to(:dates) }
  it { should respond_to(:max_registrants) }
end