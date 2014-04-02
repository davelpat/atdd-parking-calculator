class ParkCalcPage
  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.goto PARK_CALC_URL
  end

  def select_location(lot)
    @page.select_list(:id, 'ParkingLot').select(lot)
  end

  def enter_parking_duration(duration)
    case duration
      when '30 minutes'
        @page.text_field(:id, 'StartingDate').set('4/1/2014')
        @page.text_field(:id, 'StartingTime').set('12:00')
        @page.radio(:name => 'StartingTimeAMPM', :value => 'PM').set

        @page.text_field(:id, 'LeavingDate').set('4/1/2014')
        @page.text_field(:id, 'LeavingTime').set('12:30')
        @page.radio(:name => 'LeavingTimeAMPM', :value => 'PM').set
    end
  end
end
