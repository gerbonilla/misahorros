class BondsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bonds = Bond.order(:term_months)
  end

  def show
    @bond = Bond.find(params[:id])
  end
end
