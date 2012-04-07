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
#  max_registrants :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class AfterSchoolProgram < ActiveRecord::Base
  attr_accessible :day,
                  :program_name,
                  :price,
                  :status,
                  :dates,
                  :max_registrants
                  
  has_many :asp_registrations
  
end
