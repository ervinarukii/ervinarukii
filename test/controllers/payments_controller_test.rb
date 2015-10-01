require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  test "should get payment" do
    get :payment
    assert_response :success
  end

  test "should get payment_transaction" do
    get :payment_transaction
    assert_response :success
  end

  test "should get set_customer" do
    get :set_customer
    assert_response :success
  end

end
