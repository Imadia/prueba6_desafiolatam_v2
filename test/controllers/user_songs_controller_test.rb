require 'test_helper'

class UserSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_song = user_songs(:one)
  end

  test "should get index" do
    get user_songs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_song_url
    assert_response :success
  end

  test "should create user_song" do
    assert_difference('UserSong.count') do
      post user_songs_url, params: { user_song: {  } }
    end

    assert_redirected_to user_song_url(UserSong.last)
  end

  test "should show user_song" do
    get user_song_url(@user_song)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_song_url(@user_song)
    assert_response :success
  end

  test "should update user_song" do
    patch user_song_url(@user_song), params: { user_song: {  } }
    assert_redirected_to user_song_url(@user_song)
  end

  test "should destroy user_song" do
    assert_difference('UserSong.count', -1) do
      delete user_song_url(@user_song)
    end

    assert_redirected_to user_songs_url
  end
end
