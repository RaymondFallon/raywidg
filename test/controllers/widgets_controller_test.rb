require 'test_helper'

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @widget = widgets(:one)
  end

  test "should get index" do
    get widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_widget_url
    assert_response :success
  end

  test "should create widget" do
    assert_difference('Widget.count') do
      post widgets_url, params: { widget: { color: 'blue', due_by: 10.days.from_now, email: 'test@tester.org', quantity: 4, status: 'ordered', w_type: 'Widget Pro' } }
    end

    assert_redirected_to widget_url(Widget.last)
  end

  test "should show widget" do
    get widget_url(@widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_widget_url(@widget), headers: {'Authorization': ActionController::HttpAuthentication::Basic.
  encode_credentials('admin', 'uncrackable')}
    assert_response :success
  end

  test "should update widget" do
    patch widget_url(@widget), params: { widget: { color: 'blue', due_by: 10.days.from_now, email: 'test@tester.org', quantity: 4, status: 'in transit', w_type: 'Widget Pro' } }, headers: {'Authorization': ActionController::HttpAuthentication::Basic.
  encode_credentials('admin', 'uncrackable')}
    assert_redirected_to widget_url(@widget)
  end

  test "should destroy widget" do
    assert_difference('Widget.count', -1) do
      delete widget_url(@widget), headers: {'Authorization': ActionController::HttpAuthentication::Basic.
  encode_credentials('admin', 'uncrackable')}
    end

    assert_redirected_to widgets_url
  end

  test "should create normal widget" do
    widg = Widget.new(quantity: 4, email: 'test@tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert widg.save, 'Failed to create normal widget'
  end

  test "should not create without quantity" do
    widg = Widget.new(email: 'test@tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Ordered widget without entering quantity'
  end

  test "should not create without email" do
    widg = Widget.new(quantity: 4, color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Ordered widget without entering email'
  end

  test "should not create without color" do
    widg = Widget.new(quantity: 4, email: 'test@tester.org', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Ordered widget without selecting color'
  end

  test "should not create without due date" do
    widg = Widget.new(quantity: 4, email: 'test@tester.org', color:'red', w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Ordered widget without selecting due_by date'
  end

  test "should not create without widget type" do
    widg = Widget.new(quantity: 4, email: 'test@tester.org', color:'red', due_by: 10.days.from_now, status:'ordered')
    assert_not widg.save, 'Ordered widget without selecting widget type'
  end


  test "should not accept invalid color" do
    widg = Widget.new(quantity: 4, email: 'test@tester.org', color:'orange', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Accepted invalid color'
  end

  test "should not accept invalid widget type" do
    widg = Widget.new(quantity: 4, email: 'test@tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget Micro', status:'ordered')
    assert_not widg.save, 'Accepted invalid widget type'
  end


  test "should not accept negative quantity" do
    widg = Widget.new(quantity: -3, email: 'test@tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Accepted negative quantity'
  end

  test "should not accept quantity of zero" do
    widg = Widget.new(quantity: 0, email: 'test@tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Accepted quantity of zero'
  end

  test "should not accept non-integer quantity" do
    widg = Widget.new(quantity: 3.4, email: 'test@tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Accepted non-integer quantity'
  end

  test "should not accept due date before one week from now" do
    widg = Widget.new(quantity: 4, email: 'test@tester.org', color:'red', due_by: 4.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Accepted widget order before 7-day wait time'
  end

  test "should not accept invalid email address" do
    widg = Widget.new(quantity: 4, email: '@badtest@tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Accepted invalid email address'
  end

  test "should not accept invalid email address 2" do
    widg = Widget.new(quantity: 4, email: 'badtest_at_tester.org', color:'red', due_by: 10.days.from_now, w_type: 'Widget', status:'ordered')
    assert_not widg.save, 'Accepted invalid email address'
  end
end
