# == Schema Information
#
# Table name: children
#
#  id                   :integer         not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  health_card          :string(255)
#  grade                :string(255)
#  child_class          :string(255)
#  campus               :string(255)
#  shoe_size            :string(255)
#  emergency_first_name :string(255)
#  emergency_last_name  :string(255)
#  emergency_phone      :string(255)
#  user_id              :integer
#  medical              :text
#  pickup_info          :text
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

class Child < ActiveRecord::Base

  
  attr_accessible :first_name,
                  :last_name,
                  :health_card,
                  :medical,
                  :grade,
                  :child_class,
                  :campus,
                  :emergency_first_name,
                  :emergency_last_name,
                  :emergency_phone,
                  :shoe_size
  
    belongs_to :user
    has_many :asp_registrations
end
