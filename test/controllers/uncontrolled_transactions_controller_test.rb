# frozen_string_literal: true

require 'test_helper'

class UncontrolledTransactionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get uncontrolled_transactions_index_url
    assert_response :success
  end
end
