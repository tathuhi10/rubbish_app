require 'test_helper'

class RubbishTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  # 初期表示画面のレイアウトテスト
  test "index layout" do
    get root_path
    # Homeページが正しいビューを描画しているかどうか確かめる
    assert_template 'rubbish/home'

    # プルダウン
    assert_select "form option", 1

    # 検索ボックス
    assert_select "form input[type=text]", 1

    # 検索ボタン
    assert_select "form input[type=submit]", 1
    assert_select "form input[value=?]", "検索"
    
  end

  # 検索ボタンを押したときのテスト
  test "search" do

    # 初期画面表示
    get root_path

    # 検索ボタン
    post search_path, params: {}
    assert_response :success

  end

end
