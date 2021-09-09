class Api::UsersController < Api::ApiController
  before_action :authorize_request, except: [:login, :create]

  #POST  /api/sign_up
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  # POST /api/users/login
  def login
    @user = User.find_by_email(params[:email])
    if @user.valid_password?(params[:password])
      token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base)
      render json: { token: token, email: @user.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:f_name, :l_name, :contact, :email, :password, :password_confirmation)
  end

  def login_params
    params.permit(:email, :password)
  end
end
