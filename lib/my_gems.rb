require 'gems'

GemDTO = Struct.new(:name, :downloads)

module MyGems
  def self.show
    puts "⭐ Let's see if you're a star!⭐ "
    puts "📚 Here's your summary:"
    puts "\n"

    my_gems = Gems.gems.map { |gem| GemDTO.new(gem['name'], gem['downloads']) }
    gem_with_longest_name = my_gems.max_by { |gem| gem.name.length }

    my_gems.each do |gem|
      name_output = gem.name.ljust(gem_with_longest_name.first.length)
      puts "🛑 #{name_output} 🔝 #{gem.downloads} downloads"
    end

    puts "\n"
    puts "Bye! See you soon 👋👋👋"
  end
end
