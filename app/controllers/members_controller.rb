class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully update.'
    end 
  end

  def create
    if @member = Member.create(member_params)
      redirect_to @member, notice: 'Member was successfully created.'
    end
  end

  def destroy
    @member.destroy
    redirect_to members_path, notice: 'Member was successfully destroyed.'
  end


  private
  def set_member
    @member = Member.find(params[:id])
  end

    def member_params
      params.require(:member).permit(:name, :surname, :email, :birthday)
    end
end
