require 'bundler/setup'
require 'cleverbot-api'

bot1 = CleverBot.new
bot2 = CleverBot.new

current = ''
loop do
  current = bot1.think current
  puts "Bot A: #{current}"

  current = bot2.think current
  puts "Bot B: #{current}"
end
