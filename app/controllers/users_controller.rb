class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.display_string }.join("\n")
  end

  def show
    user = User.find(params[:id])
    render plain: user.display_string
  end

  def create
    user = User.create!(name: params[:name], email: params[:email], password: params[:password])
    render plain: "The newly added user is: #{user.display_string}"
  end

  def login
    i_email = params[:email]
    i_pass = params[:password]
    user = User.find_by(email: i_email, password: i_pass)
    render plain: user ? true : false
  end
end
