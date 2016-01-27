# coding: utf-8
class AccountsController < ApplicationController
  before_filter :login_required

  def show
    @member = @current_member
  end

  def edit
    @member = @current_member
  end

  def update
    @member = @current_member
# Rails3    @member.assign_attributes(params[:member])
    @member.assign_attributes(params[:member].
    permit(:name, :full_name, :email, :remark, :hashed_password,
     :number, :password))
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end
end
