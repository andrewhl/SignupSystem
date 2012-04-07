class AspRegistration < ActiveRecord::Base
  belongs_to :after_school_program
  belongs_to :child
end
