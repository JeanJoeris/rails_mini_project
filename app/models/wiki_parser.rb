module WikiParser

  def self.get_wiki_hmtl(creature)
    sanizized_name = creature.gsub(" ", "_")
    url = "https://en.wikipedia.org/wiki/#{sanizized_name}"
    safely_open_url(url)
  end

  def self.safely_open_url(url)
    begin
      file = open(url)
      Nokogiri::HTML(file)
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
        nil
      else
        raise e
      end
    end
  end

  def self.get_taxonomical_data(creature)
    tax_levels = ["Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"]

    doc = get_wiki_hmtl(creature)
    if doc
      table_data = doc.css(".infobox").css("td")

      tax_data = tax_levels.map do |tax_level|
        find_data_with_word(table_data, tax_level)
      end

      tax_names = find_tax_names(tax_data)
      tax_levels.zip(tax_names).to_h
    else
      tax_levels.zip(Array.new(tax_levels.length)).to_h
    end
  end

  def self.find_data_with_word(data, word)
    data.find.with_index do |datum, index|
      data[index-1].to_s.include?(word)
    end
  end

  def self.find_tax_names(tax_data)
    tax_data.map do |tax_datum|
      if tax_datum

        # finds the text rendered on screen i.e. text between tags
        matches = tax_datum.to_html.scan(/\>[^<]+\</)

        # delete any stray newline chars hanging between tags
        matches.delete(">\n<")

        # cut the text out from the ><, delete any spaces. Thie first is necessary as it always holds the correct data
        # even if subspecies or citations are included
        matches.first.delete("><").split(".").last.gsub(/\u00a0/, " ").strip.capitalize if matches.first
      end
    end
  end

  def self.get_wiki_picture(creature)
    doc = get_wiki_hmtl(creature)
    if doc
      doc.css(".infobox").css("img").first.attributes["src"].value.reverse.chop.chop.reverse
    end
  end
end
