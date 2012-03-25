# == Schema Information
#
# Table name: challahs
#
#  id         :integer         not null, primary key
#  campus     :string(255)
#  type       :string(255)
#  price      :string(255)
#  status     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Challah < ActiveRecord::Base
end
