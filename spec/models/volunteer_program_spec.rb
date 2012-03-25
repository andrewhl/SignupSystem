# == Schema Information
#
# Table name: volunteer_programs
#
#  id              :integer         not null, primary key
#  program_name    :string(255)
#  dates           :string(255)
#  status          :string(255)
#  max_registrants :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'spec_helper'

describe VolunteerProgram do
  pending "add some examples to (or delete) #{__FILE__}"
end
