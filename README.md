# CleverBot API
A very basic and barebones API implementation for CleverBot.

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

## Other languages
You can find an implementation for *Mono/.NET*, *Java*, *Python* and *PHP* by Pierre-David Bélanger [here](http://code.google.com/p/chatter-bot-api/).

## Credits
Many thanks to Pierre-David Bélanger for his support and his implementation of the API (over which I've partially based my own version).