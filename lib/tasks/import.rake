require "roo"

desc "Import data from excel"
task import: :environment do
  Match.destroy_all
  Person.destroy_all

  sheet = Roo::Spreadsheet.open("2016.xlsx")

  parse_established sheet.sheet(0)
  parse_newcomers sheet.sheet(1)
  parse_interested sheet.sheet(2)
  parse_matches sheet.sheet(3)
  parse_concluded sheet.sheet(4)
end

def parse_established(sheet)
end

def parse_newcomers(sheet)
end

def parse_interested(sheet)
end

def parse_matches(sheet)
  sheet.each_row_streaming(offset: 1) do |row|
    next unless row[0].value
    attrs = {
      newcomer: row[1].value.try(:strip),
      established: row[2].value.try(:strip),
      country: row[3].value.try(:strip),
      started_at: row[4].value || Time.zone.now, # TODO: something wrong here in the file?
      comment: row[11].try(:value).try(:strip)
    }
    Match.create!(
      established: Person.create!(name: attrs[:established], status: :established),
      newcomer: Person.create!(name: attrs[:newcomer], status: :newcomer),
      started_at: attrs[:started_at],
      concluded_at: attrs[:started_at] + 6.months, # TODO: can we do this or do we need to parse end date?
      comment: attrs[:comment]
    )
  end
end

def parse_concluded(sheet)
end
