module Import
  module Remittances
    class << self
      def add_to_ledger(ledger, filepath)
        f = File.open(filepath)
        docs = Import::Bgpb.parse(f)

        find_remittances(docs).each do |remittance_hash|
          add_remittance_to_ledger(remittance_hash, ledger)
        end

        ledger
      ensure
        f.close
      end

      private

      def find_remittances(docs)
        docs.select { |doc| doc['CreQ'] > 0 }
      end

      def add_remittance_to_ledger(rhash, ledger)
        ledger.remittances.create!(currency: 'USD', amount: rhash['CreQ'], transferred_at: rhash['DocDate'])
      end
    end
  end
end
