class ParkCalcPage
  @@lotIdentifier = 'ParkingLot'
  @@startingPrefix = 'Starting'
  @@leavingPrefix = 'Leaving'

  # array elements: date, time, and AM/PM for start of duration, then the same for when they leave
  @@durationMap = {
    '30 minutes' => ['4/1/2014', '12:00', 'PM', '4/1/2014', '12:30', 'PM']
  }
  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.goto PARK_CALC_URL
  end

  def select_location(lot)
    @page.select_list(:id, @@lotIdentifier).select(lot)
  end

  def enter_parking_duration(duration)
    startingDate, startingTime, startingTimeAMPM,
        leavingDate, leavingTime, leavingTimeAMPM = @@durationMap[duration]
    fill_in_date_and_time_for(@@startingPrefix, startingDate, startingTime, startingTimeAMPM)
    fill_in_date_and_time_for(@@leavingPrefix, leavingDate, leavingTime, leavingTimeAMPM)
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
