require 'test_helper'

class InstanceTest < ActiveSupport::TestCase
  test 'validates unique host and version' do
    host = 'soundscape.test'
    instance = Instance.new

    refute instance.valid?
    assert instance.errors.key?(:host)
    assert instance.errors.key?(:version)

    instance.host = host

    refute instance.valid?
    refute instance.errors.key?(:host), instance.errors[:host]
    assert instance.errors.key?(:version)

    instance.version = '1.0.0'

    assert instance.valid?
    assert_empty instance.errors
    assert instance.save

    instance = Instance.new(host: host, version: '1.0.1')

    refute instance.valid?
    assert_includes instance.errors[:host], 'has already been taken'
  end
end
