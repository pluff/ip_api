namespace :import do
  desc 'Upload a file to S3 for use in data migrations'
  task bgpb: :environment do
    l = Ledger.create!
    Import::Remittances.add_to_ledger(l, ENV['remittances'])
    Import::Exchanges.add_to_ledger(l, ENV['exchanges'])
    puts "http://localhost:3000/#/#{l.access_token}"
  end
end
