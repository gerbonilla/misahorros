require 'csv'

csv_options = { col_sep: ',', headers: :first_row, :encoding => 'ISO-8859-1' }
filepath    = Rails.root.join("db", "tasas_bancos.csv")
terms = [1, 2, 3, 4, 6, 12, 18, 24, 36, 60]
CSV.foreach(filepath, csv_options) do |row|
puts "**************"
  bank = Bank.create!(name: row['Bank'], country: row['Country'], fitch: row['Fitch'])
  puts "#{bank.name} created"
  terms.each do |months|
    if row["#{months}"] != "NA"
      bond = Bond.create!(term_months: months, term_years: (months/12), bank: bank, country: bank.country, nominal_rate: row["#{months}"], currency: "USD")
      puts "***#{bond.term_months} month at #{bond.nominal_rate * 100}%"
    end
  end
end
