require 'test_helper'

class NasasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nasa = nasas(:one)
  end

  test "should get index" do
    get nasas_url
    assert_response :success
  end

  test "should get new" do
    get new_nasa_url
    assert_response :success
  end

  test "should create nasa" do
    assert_difference('Nasa.count') do
      post nasas_url, params: { nasa: { api: @nasa.api, url: @nasa.url } }
    end

    assert_redirected_to nasa_url(Nasa.last)
  end

  test "should show nasa" do
    get nasa_url(@nasa)
    assert_response :success
  end

  test "should get edit" do
    get edit_nasa_url(@nasa)
    assert_response :success
  end

  test "should update nasa" do
    patch nasa_url(@nasa), params: { nasa: { api: @nasa.api, url: @nasa.url } }
    assert_redirected_to nasa_url(@nasa)
  end

  test "should destroy nasa" do
    assert_difference('Nasa.count', -1) do
      delete nasa_url(@nasa)
    end

    assert_redirected_to nasas_url
  end
end
