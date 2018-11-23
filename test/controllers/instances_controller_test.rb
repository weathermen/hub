require 'test_helper'

class InstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instance = instances(:one)
    @user = users(:one)
  end

  test 'view all instances' do
    get root_url

    assert_response :success
  end

  test 'create ping response' do
    assert_difference -> { Instance.count } do
      post instances_url, params: {
        instance: {
          host: 'soundstorm.org',
          version: '1.0.0'
        }
      }
    end
    assert_response :created
  end

  test 'update ping response' do
    instance = instances(:one)

    post instances_url, params: {
      instance: {
        host: instance.host,
        version: '1.0.1'
      }
    }

    assert_response :created
    assert_equal '1.0.1', instance.reload.version
  end

  test 'edit instance' do
    sign_in @user, 'Password1'
    patch instance_url(@instance), params: {
      instance: {
        host: 'soundstorm.rocks'
      }
    }

    assert_redirected_to root_url
    assert_equal 'soundstorm.rocks', @instance.reload.host
  end

  test 'delete instance' do
    sign_in @user, 'Password1'
    delete instance_url(@instance)

    assert_redirected_to root_url
    assert_nil flash[:alert], flash[:alert]
    refute_nil flash[:notice]
  end
end
