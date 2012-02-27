# == Schema Information
#
# Table name: children
#
#  id                   :integer         not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  health_card          :string(255)
#  medical              :text
#  grade                :string(255)
#  class                :string(255)
#  campus               :string(255)
#  parent_id            :integer
#  emergency_first_name :string(255)
#  emergency_last_name  :string(255)
#  emergency_phone      :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  shoe_size            :string(255)
#

class Child < ActiveRecord::Base
end
