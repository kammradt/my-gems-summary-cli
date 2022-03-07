# frozen_string_literal: true

require 'gems'

GemDTO = Struct.new(:name, :downloads)

module MyGems
  def self.valid_credentials?
    Gems.gems
  rescue StandardError
    puts '🥺 Opps, looks like we are missing your rubygems.org credentials 😭'
    puts "🥺 Let's authenticate 😭"

    puts "💻 Please run 'gem signin' and try again 💻"
  end

  def self.my_gems
    gems = Gems.gems.map { |gem| GemDTO.new(gem['name'], gem['downloads']) }
    gems.sort_by(&:downloads).reverse
  end

  def self.valid_gems?(gems)
    return gems unless gems.empty?

    puts '🥺 Opps, looks like you have no gems 😭'
    puts "🥺 Let's add some 💻"

    puts "💻 Please run 'gem build & gem push' and try again 💻"
    puts "💻 Maybe you can find some funny stuff here github.com/kammradt 💻"
  end

  def self.gem_with_longest_name(gems)
    gems.max_by { |gem| gem.name.length }
  end

  def self.show
    puts "⭐ Let's see if you're a star!⭐ "
    return unless valid_credentials?

    gems = my_gems
    return unless valid_gems?(gems)

    puts "📚 Here's your summary:"
    puts "\n"

    gems.each do |gem|
      name_output = gem.name.ljust(gem_with_longest_name(gems).name.length)
      puts "🛑 #{name_output} 🔝 #{gem.downloads} downloads"
    end

    puts "\n"
    puts 'Bye! See you soon 👋👋👋'
  end
end
