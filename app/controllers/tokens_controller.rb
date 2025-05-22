# frozen_string_literal: true

class TokensController < ApplicationController
  def index
    @tokens = Token.all.order(:id)
  end

  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)
    if @token.save
      redirect_to tokens_path, notice: "Token was successfully created."
    else
      render :new
    end
  end

  def edit
    @token = Token.find(params[:id])
  end

  def update
    @token = Token.find(params[:id])
    if @token.update(token_params)
      redirect_to tokens_path, notice: "Token was successfully updated."
    else
      render :edit
    end
  end

  private

  def token_params
    params.require(:token).permit(
      :symbol_name,
      :platform_id,
      :enabled,
      :volume_by_percent,
      :volume_by_value,
      :volume_type,
      :initial_balances,
      :current_balances,
    )
  end
end
