# == Schema Information
#
# Table name: after_school_programs
#
#  id              :integer         not null, primary key
#  day             :string(255)
#  program_name    :string(255)
#  price           :string(255)
#  status          :string(255)
#  dates           :string(255)
#  payable_to      :string(255)
#  campus          :string(255)
#  notes           :text
#  max_registrants :integer
#  min_registrants :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

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
