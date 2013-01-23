require 'test_helper'

class NodeTest < ActiveSupport::TestCase

  setup do
    Node.all.each { |n| n.remove }
    
  end

  test 'fields timestamps' do
    n = Node.new
    assert n.save
    assert_not_nil n.created_at
    
  end

end


