namespace :procedures do
  SOURCE_URL = 'https://en.wikipedia.org/wiki/Medical_procedure'
  PATTERN = "//div[@class='mw-parser-output']/ul[position()>1]/li"

  desc 'Sync list of procedures'
  task sync: [:environment] do
    procedures.each do |title|
      Procedure
        .where(title: title)
        .first_or_create(title: title)
    end
    puts "[Procedures] Done! (total: #{Procedure.count})"
  end

  def procedures
    document
      .xpath(PATTERN)
      .flat_map { |obj| obj.text.split("\n") }
  end

  def document
    Nokogiri::HTML.parse(URI.open(SOURCE_URL))
  end

end
