class ParkCalcPage
  @@lotIdentifier = 'ParkingLot'
  @@startingPrefix = 'Starting'
  @@leavingPrefix = 'Leaving'

  # array elements: date, time, and AM/PM for start of duration, then the same for when they leave
  @@durationMap = {
      '30 minutes'           => ['04/04/2014', '12:00', 'AM', '04/04/2014', '12:30', 'AM'],
      '1 hour'               => ['04/04/2014', '12:00', 'AM', '04/04/2014', '01:00', 'AM'],
      '1 hour 30 minutes'    => ['04/04/2014', '12:00', 'AM', '04/04/2014', '01:30', 'AM'],
      '2 hours'              => ['04/04/2014', '12:00', 'AM', '04/04/2014', '02:00', 'AM'],
      '3 hours'              => ['04/04/2014', '12:00', 'AM', '04/04/2014', '03:00', 'AM'],
      '3 hours 30 minutes'   => ['04/04/2014', '12:00', 'AM', '04/04/2014', '03:30', 'AM'],
      '5 hours'              => ['04/04/2014', '12:00', 'AM', '04/04/2014', '04:00', 'AM'],
      '5 hours 1 minute'     => ['04/04/2014', '12:00', 'AM', '04/04/2014', '05:01', 'AM'],
      '12 hours'             => ['04/04/2014', '12:00', 'AM', '04/04/2014', '12:00', 'PM'],
      '12 hours 30 minutes'  => ['04/04/2014', '12:00', 'AM', '04/04/2014', '12:30', 'PM'],
      '24 hours'             => ['04/04/2014', '12:00', 'AM', '04/05/2014', '12:00', 'AM'],
      '1 day 1 minute'       => ['04/04/2014', '12:00', 'AM', '04/05/2014', '12:01', 'AM'],
      '1 day 30 minutes'     => ['04/04/2014', '12:00', 'AM', '04/05/2014', '12:30', 'AM'],
      '1 day 1 hour'         => ['04/04/2014', '12:00', 'AM', '04/05/2014', '01:00', 'AM'],
      '3 days'               => ['04/04/2014', '12:00', 'AM', '04/07/2014', '12:00', 'AM'],
      '1 week'               => ['04/04/2014', '12:00', 'AM', '04/11/2014', '12:00', 'AM']
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
