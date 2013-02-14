# CleverBot API
A very basic and barebones API implementation for CleverBot. Many thanks to Pierre-David Bélanger for his support and [his implementation](http://code.google.com/p/chatter-bot-api/) of the API (over which I've based my own version).

## Usage
This library is pretty easy to use. You can create a new bot using the method `CleverBot#new`, then make it think using `#think`:
```ruby
require 'cleverbot-api'

bot = CleverBot.new

puts bot.think 'Hello there.' #=> "How are you?"
puts bot.think 'Fine.'        #=> "Good."
```
### Backlog
You can also use the `#backlog` method to get access to an array of responses (first is the oldest, last is the newest).

Responses are instances of the `CleverBotResponse` class. You can access the question and its corresponding answer using `#question` and `#answer`.
```ruby
puts bot.backlog.first.question    #=> "Hello there."
puts bot.backlog.last.answer       #=> "Good."
```
