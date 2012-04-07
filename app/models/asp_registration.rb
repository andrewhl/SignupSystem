# == Schema Information
#
# Table name: asp_registrations
#
#  id                      :integer         not null, primary key
#  child_id                :integer
#  after_school_program_id :integer
#  created_at              :datetime        not null
#  updated_at              :datetime        not null
#

class AspRegistration < ActiveRecord::Base
  belongs_to :after_school_program
  belongs_to :child
end
