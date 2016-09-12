module WikiParser

  def self.get_wiki_hmtl(creature)
    sanizized_name = creature.gsub(" ", "_")
    Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{sanizized_name}"))
  end

  def self.get_taxonomical_data(creature)
    doc = get_wiki_hmtl(creature)
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
      if tax_datum
        matches = tax_datum.to_html.scan(/\>[^<]+\</) # finds the text rendered on screen i.e. text between tags
        matches.delete(">\n<") # delete any stray newline chars hanging between tags
        matches.first.delete("><").split(".").last.gsub(/\u00a0/, " ").strip.capitalize if matches.first # cut the text out from the ><, delete any spaces
      end
    end
  end

  def self.get_wiki_picture(creature)
    doc = get_wiki_hmtl(creature)
    doc.css(".infobox").css("img").first.attributes["src"].value.reverse.chop.chop.reverse
  end
end
