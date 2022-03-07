require 'gems'

GemDTO = Struct.new(:name, :downloads)

module MyGems
  def self.valid_credentials?
    begin
      Gems.gems
    rescue
      puts '🥺 Opps, looks like we are missing your rubygems.org credentials 😭'
      puts "🥺 Let's authenticate 😭"

      puts "💻 Please run 'gem signin' and try again 💻"
    end
  end

  def self.show
    puts "⭐ Let's see if you're a star!⭐ "
    return unless valid_credentials?

    puts "📚 Here's your summary:"
    puts "\n"
    
    my_gems = Gems.gems.map { |gem| GemDTO.new(gem['name'], gem['downloads']) }
    my_gems = my_gems.sort_by(&:downloads).reverse
    
    gem_with_longest_name = my_gems.max_by { |gem| gem.name.length }

    my_gems.each do |gem|
      name_output = gem.name.ljust(gem_with_longest_name.first.length)
      puts "🛑 #{name_output} 🔝 #{gem.downloads} downloads"
    end

    puts "\n"
    puts "Bye! See you soon 👋👋👋"
  end
end
