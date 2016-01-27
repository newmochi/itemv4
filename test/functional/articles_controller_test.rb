# coding: utf-8
require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "index" do
    5.times { Factory(:article) }
    get :index
    assert_response :success
    assert_equal 5, assigns[:articles].count
  end

  test "show" do
    article = Factory(:article)
    get :show, id: article
    assert_response :success
  end


  test "new" do
    get :new
    assert_response :success
  end

  test "edit" do
    article = Factory(:article)
    get :edit, id: article
    assert_response :success
  end


  test "create" do
    post :create, article: Factory.attributes_for(:article)
    article = assigns[:article]
    assert_redirected_to article
  end

  test "update" do
    article = Factory(:article)
    put :update, id: article, article: Factory.attributes_for(:article)
    assert_redirected_to article
  end

=begin コメントコメントコメント開始
  test "fail to create" do
    attrs = Factory.attributes_for(:article, asciino: "")
    post :create, article: attrs
    assert_response :success
    assert_template "new"
  end

  test "fail to update" do
    attrs = Factory.attributes_for(:article, servername: "")
    article = Factory(:article)
    put :update, id: article, article: attrs
    assert_response :success
    assert_template "edit"
  end

=end コメントコメントコメント終了
  test "destroy" do
    article = Factory(:article)
    delete :destroy, id: article
    assert_redirected_to :articles
    assert_raise(ActiveRecord::RecordNotFound) {
      Article.find(article.id) }
  end



end