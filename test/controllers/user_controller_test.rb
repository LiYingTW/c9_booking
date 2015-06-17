require 'test_helper'

class UserControllerTest < ActionController::TestCase
   test "the truth" do
     assert true
   end
   
  def test_the_truth
    assert true
  end
  
  test "should get new page" do
    get :new
    assert_response :success
  end
  
  test "should get profile page" do
    get :profile
    assert_response :success
  end
  
end
