require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile_name" do	
  	user = User.new
  	user.profile_name = users(:garrett).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

    test "a user" do	
  	user = User.new
  	user.profile_name = "My Profile with spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name]
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name:'Garrett', last_name: 'Rodriguez', email: 'garrett@aoiarlington.com')
    user.password = user.password_confirmation = 'password'
    user.profile_name = "grod_1"
    assert user.valid?
  end

end