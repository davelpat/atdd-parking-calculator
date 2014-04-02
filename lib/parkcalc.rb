class ParkCalcPage
  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.goto PARK_CALC_URL #'/parkcalc'
  end
end
