class BondsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bonds = Bond.order(:term_months)
    @terms = [1, 2, 3, 4, 6, 12, 18, 24, 36, 60]
  end

  def show
    @bond = Bond.find(params[:id])
  end
end
