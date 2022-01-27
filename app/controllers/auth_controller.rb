# frozen_string_literal: true

class AuthController < ApplicationController
  class AuthenticateError < StandardError; end

  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AuthenticateError, with: :handle_unauthenticated

  def create
    if user
      raise AuthenticateError unless user.authenticate(params.require(:password))

      render json: UserRepresenter.new(user).as_json, status: :created
    else
      render json: { error: 'No such user' }, status: :unauthorized
    end
  end

  def sign_up
    @user = User.new(user_params)

    if @user.save
      render json: UserRepresenter.new(@user).as_json, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= User.find_by(email: params.require(:email))
  end

  def parameter_missing(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def handle_unauthenticated
    render json: { error: 'Incorrect password ' }, status: :unauthorized
  end

  def user_params
    params.permit(:email, :password)
  end
end
