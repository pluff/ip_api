module OfficialRates
  LOCAL_CURRENCY = Currencies::BYR
  class << self
    def [](date)
      date = date.to_date
      unless @rates[date]
        @rates[date] = {}
        api_response = Nbrb::Api.daily_rates(date)
        api_response.map do |key, currency_row|
          @rates[date][key] = currency_row[:cur_official_rate].to_f / currency_row[:cur_scale].to_f
        end
        @rates[date][LOCAL_CURRENCY] = 1
      end
      @rates[date]
    end
  end
end
