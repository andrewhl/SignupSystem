# == Schema Information
#
# Table name: users
#
#  id                :integer         not null, primary key
#  email             :string(255)
#  mother_first_name :string(255)
#  mother_last_name  :string(255)
#  mother_email      :string(255)
#  mother_work_phone :string(255)
#  mother_home_phone :string(255)
#  father_first_name :string(255)
#  father_last_name  :string(255)
#  father_email      :string(255)
#  father_work_phone :string(255)
#  father_home_phone :string(255)
#  address           :string(255)
#  city              :string(255)
#  postal_code       :string(255)
#  username          :string(255)
#  remember_token    :string(255)
#  teacher_boolean   :boolean
#  admin_boolean     :boolean
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :email,
                  :mother_first_name,
                  :mother_last_name,
                  :mother_work_phone,
                  :mother_home_phone,
                  :father_first_name,
                  :father_last_name,
                  :father_email,
                  :father_work_phone,
                  :address,
                  :city,
                  :postal_code,
                  :username,
                  :password, 
                  :password_confirmation
                  
  has_secure_password
  before_save :create_remember_token
  
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_regex }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
