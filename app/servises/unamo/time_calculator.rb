module Unamo
  class TimeCalculator
    class << self
      def time_for_period(period)
        time_hash = {:one_week => 1.week.ago, :two_weeks => 2.weeks.ago, :one_month => 1.month.ago}
        date = time_hash[period]
        date.strftime("%d/%m/%Y")
      end

      def current_time(period)
        {:one_week => "1 week", :two_weeks => "2 weeks", :one_month => "1 month"}[period]
      end
    end
  end
end
