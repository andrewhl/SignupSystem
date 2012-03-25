# == Schema Information
#
# Table name: users
#
#  id                :integer         not null, primary key
#  email             :string(255)
#  first_name        :string(255)
#  last_name         :string(255)
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
#  campus            :string(255)
#  remember_token    :string(255)
#  password_digest   :string(255)
#  teacher           :boolean         default(FALSE)
#  admin             :boolean         default(FALSE)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

require 'spec_helper'

describe User do

  before do 
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:mother_first_name) }
  it { should respond_to(:mother_last_name) }
  it { should respond_to(:mother_work_phone) }
  it { should respond_to(:mother_home_phone) }
  it { should respond_to(:father_first_name) }
  it { should respond_to(:father_last_name) }
  it { should respond_to(:father_email) }
  it { should respond_to(:father_work_phone) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:postal_code) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:admin) }
  it { should respond_to(:teacher) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }
  it { should_not be_admin }
  it { should_not be_teacher }
  
  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end
  
  describe "when first name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when first name is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when last name is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end
  
  describe "when email format is valid" do
    valid_addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
  describe "with admin attribute set to 'true'" do
    before { @user.toggle!(:admin) }
    
    it { should be_admin }
  end
  
  describe "with teacher attribute set to 'true'" do
    before { @user.toggle!(:teacher) }
    
    it { should be_teacher }
  end
  

end
