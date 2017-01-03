module Import
  module Exchanges
    class << self
      def add_to_ledger(ledger, filepath)
        f = File.open(filepath)
        docs = Import::Bgpb.parse(f)

        find_exchanges(docs).each do |ehash|
          add_exchange_to_ledger(ehash, ledger)
        end

        ledger
      ensure
        f.close
      end

      private

      def find_exchanges(docs)
        docs.select { |doc| doc['Credit'] > 0 }
      end

      def add_exchange_to_ledger(rhash, ledger)
        rate = /курс(у?) (?<rate>\d+\.\d*)/i.match(rhash['Nazn'])[:rate].to_f
        ledger.exchanges.create!(
          from_currency: 'USD',
          to_currency: 'BYR',
          amount: rhash['Credit']/rate,
          transferred_at: rhash['DocDate'],
          exchange_rate: rate
        )
      end
    end
  end
end
