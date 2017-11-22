class BondsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bonds = Bond.order(:term_months)
    @terms = [1, 2, 3, 4, 6, 12, 18, 24, 36, 60]
    @countries = []
    @filters = {}
    @bonds.each do |b|
      @countries << b.country unless @countries.include?(b.country)
    end
    respond_to do |format|
      format.html
      format.js {
        @filters = setFilters(params[:countryFilter], params[:termFilter])
        @filteredBonds = @bonds.reject do |b|
          @filters[:countries].include?(b.country) || @filters[:terms].include?(b.term_months.to_i)
        end
      }
    end
  end

  def show
    @bond = Bond.find(params[:id])
    @contact = Contact.new()
  end

  private

  def bond_params
    params.require(:bond).permit(:countryFilter, :termFilter)
  end

  def setFilters(countryF, termF)
    filters = {}
    filters[:countries] = countryF.split(" ").map{|c| c.gsub("_", " ")}
    filters[:terms] = termF.split(" ").map{|t| t.to_i}
    return filters
  end

end
