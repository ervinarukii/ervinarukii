require 'test_helper'

class AnimesControllerTest < ActionController::TestCase
  setup do
    @anime = animes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anime" do
    assert_difference('Anime.count') do
      post :create, anime: { description: @anime.description, duration: @anime.duration, end_aired: @anime.end_aired, episodes: @anime.episodes, producer_id: @anime.producer_id, start_aired: @anime.start_aired, status: @anime.status, title: @anime.title, user_id: @anime.user_id }
    end

    assert_redirected_to anime_path(assigns(:anime))
  end

  test "should show anime" do
    get :show, id: @anime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anime
    assert_response :success
  end

  test "should update anime" do
    patch :update, id: @anime, anime: { description: @anime.description, duration: @anime.duration, end_aired: @anime.end_aired, episodes: @anime.episodes, producer_id: @anime.producer_id, start_aired: @anime.start_aired, status: @anime.status, title: @anime.title, user_id: @anime.user_id }
    assert_redirected_to anime_path(assigns(:anime))
  end

  test "should destroy anime" do
    assert_difference('Anime.count', -1) do
      delete :destroy, id: @anime
    end

    assert_redirected_to animes_path
  end
end
