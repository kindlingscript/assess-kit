require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "comment created" do
    user = FactoryGirl.create(:user)
    sign_in user

    place = FactoryGirl.create(:place)

    post :create, :place_id => place.id, :comment => {
    		:message => 'blank spaces',
    		:rating => 'four stars'
    		}

    assert_redirected_to place_path(place)

    assert_equal 1, user.comments.count
  end
end
