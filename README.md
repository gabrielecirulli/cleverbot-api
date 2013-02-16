# CleverBot API
[![Code Climate](https://codeclimate.com/github/gabrielecirulli/cleverbot-api.png)](https://codeclimate.com/github/gabrielecirulli/cleverbot-api)

A very basic and barebones API implementation for CleverBot.

If you're looking for an implementation in another language, you can check out Pierre-David Bélanger's version for *Mono/.NET*, *Java*, *Python* and *PHP* [here](http://code.google.com/p/chatter-bot-api/).

## Installation
Installation is very simple. Just run:
```
gem install cleverbot-api
```
You can then include the CleverBot API in your programs with:
```ruby
require 'cleverbot-api'
```
That's it!

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

## Other things
### Bugs and improvements
If you want to report a bug you've found, or would like to request an improvement or the addition of a new feature, you may do that by [submitting a new issue](../../issues/new) to this repository.

### Credits
Many thanks to Pierre-David Bélanger for his support and his implementation of the API (over which I've partially based my own version).

## License
The CleverBot API is released under the MIT License.
```
Copyright (c) 2013 Gabriele Cirulli

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
