# == Schema Information
#
# Table name: lunch_items
#
#  id          :integer         not null, primary key
#  item_name   :string(255)
#  option_name :string(255)
#  dates       :string(255)
#  campus      :string(255)
#  vendor      :string(255)
#  day         :string(255)
#  price       :string(255)
#  status      :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe LunchItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
