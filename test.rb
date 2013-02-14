require 'bundler/setup'
require 'cleverbot-api'

bot1 = CleverBot.new
bot2 = CleverBot.new

current = ''
loop do
  current = bot1.think current
  puts "Bot1: #{current}"

  current = bot2.think current
  puts "Bot2: #{current}"
end