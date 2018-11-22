require 'test_helper'

class InstancesControllerTest < ActionDispatch::IntegrationTest
  test 'view all instances' do
    get root_url

    assert_response :success
  end

  test 'find or create an instance' do
    assert_difference -> { Instance.count } do
      post instances_url, params: {
        instance: {
          host: 'soundstorm.test',
          version: '1.0.0'
        }
      }
    end
    assert_response :created
  end
end
