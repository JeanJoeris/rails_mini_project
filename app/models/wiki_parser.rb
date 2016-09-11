module WikiParser

  def self.get_taxonomical_data(creature)
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{creature}"))
    table_data = doc.css(".infobox").css("td")
    tax_levels = ["Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"]
    tax_data = tax_levels.map do |tax_level|
      find_data_with_word(table_data, tax_level)
    end
    tax_names = find_tax_names(tax_data)
    tax_levels.zip(tax_names).to_h
  end

  def self.find_data_with_word(data, word)
    data.find.with_index do |datum, index|
      data[index-1].to_s.include?(word)
    end
  end

  def self.find_tax_names(tax_data)
    tax_data.map do |tax_datum|
      # byebug
      if tax_datum
        matches = tax_datum.to_html.scan(/\>[^<]+\</)
        matches.delete(">\n<")
        matches.first.delete("><").split(".").last.gsub(/\u00a0/, " ").strip.capitalize if matches.first
      end
      # /\>[^<]+\</.match(tax_datum.to_html).to_s
    end
  end

  # def find_row_after_a_word(td_rows, word)
  #   result = nil
  #   td_rows.each_with_index do |row, index|
  #     # puts row
  #     # puts "~*~*~*~*~*~*~*~*~*~~*"
  #     result = td_rows[index+1] if row.to_s.include?(word)
  #     # byebug if result
  #     # puts result.children.text if result
  #   end
  #   result
  # end
end
