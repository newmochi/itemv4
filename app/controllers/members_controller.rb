# coding: utf-8

class MembersController < ApplicationController
  before_filter :login_required

  # member一覧
  def index
    @members = Member.order("number").
      paginate(page: params[:page], per_page: 15)
  end

  # 検索
  def search
    @members = Member.search(params[:q]).
      paginate(page: params[:page], per_page: 15)
    render "index"
  end

  # ユーザリストの詳細
  def show
    @member = Member.find(params[:id])
  end

  # 新規作成フォーム
#  def new
#    @member = Member.new()
#  end

  # 更新フォーム
#  def edit
#    @member = Member.find(params[:id])
#  end

  # ユーザの新規登録
#  def create
#    @member = Member.new(params[:member])
#    if @member.save
#      redirect_to @member, notice: "ユーザを登録しました。"
#    else
#      render "new"
#    end
#  end

  # ユーザリストの更新
#  def update
#    @member = Member.find(params[:id])
#    @member.assign_attributes(params[:member])
#    if @member.save
#      redirect_to @member, notice: "ユーザリストを更新しました。"
#    else
#      render "edit"
#    end
#  end

  # ユーザの削除
#  def destroy
#    @member = Member.find(params[:id])
#    @member.destroy
#    redirect_to :members, notice: "ユーザを削除しました。"
#  end
end