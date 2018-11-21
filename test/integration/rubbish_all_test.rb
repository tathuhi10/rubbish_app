require 'test_helper'

class RubbishAllTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  # 初期表示画面のレイアウトテスト
  test "index layout" do
    get root_path
    # Homeページが正しいビューを描画しているかどうか確かめる
    assert_template 'rubbish/home'

    # プルダウン
    assert_select "form select", 1
    assert_select "form option", 3

    # 検索ボックス
    assert_select "form input[type=text]", 1

    # 検索ボタン
    assert_select "form input[type=submit]", 1
    assert_select "form input[value=?]", "検索"
    
  end

  # 検索ボタンを押したときのテスト(結果あり)
  test "search success" do

    # 初期画面表示
    get root_path

    # 検索ボタン
    post search_path, params: {region: 1, word: "靴"}
    assert_response :success

    # 結果
    assert_select "table", 1

    # 結合結果テスト用
    assert_select "td[id='region']", "大田区"
    assert_select "td[id='rubbish_name']", "靴"

  end

  # 検索ボタンを押したときのテスト(全件)
  test "search success all" do

    # 初期画面表示
    get root_path

    # 検索ボタン
    post search_path, params: {region: 1, word: ''}
    assert_response :success

    # 結果
    assert_select "table", 1

  end

  # 検索ボタンを押したときのテスト(結果なし)
  test "search error" do

    # 初期画面表示
    get root_path

    # 検索ボタン
    post search_path, params: {region: 1, word: 'ありえない単語'}
    assert_response :success

    # 結果
    assert_select "table", 0

  end

end
