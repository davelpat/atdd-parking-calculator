class ParkCalcPage
  @@lotIdentifier = 'ParkingLot'
  @@startingPrefix = 'Starting'
  @@leavingPrefix = 'Leaving'

  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.goto PARK_CALC_URL
  end

  def select_location(lot)
    @page.select_list(:id, @@lotIdentifier).select(lot)
  end

  def enter_parking_duration(duration)
    case duration
      when '30 minutes'
        fill_in_date_and_time_for(@@startingPrefix, '4/1/2014', '12:00', 'PM')
        fill_in_date_and_time_for(@@leavingPrefix, '4/1/2014', '12:30', 'PM')
    end
  end

  def fill_in_date_and_time_for(prefix, date, time, ampm)
    @page.text_field(:id, "#{prefix + 'Date'}").set(date)
    @page.text_field(:id, "#{prefix + 'Time'}").set(time)
    @page.radio(:name => "#{prefix + 'TimeAMPM'}", :value => ampm).set
  end

  def calculated_fee()
    @page.button(:name => 'Submit').click
    @page.table.row(:text => /ESTIMATED PARKING COSTS/).cell(:index => 1).span(:index => 0).text
  end
end
