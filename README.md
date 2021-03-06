Email predictor
===

[![Code Climate](https://codeclimate.com/github/joaomilho/email_predictor.png)](https://codeclimate.com/github/joaomilho/email_predictor) [![Build Status](https://travis-ci.org/joaomilho/email_predictor.svg?branch=master)](https://travis-ci.org/joaomilho/email_predictor) [![Coverage Status](https://img.shields.io/coveralls/joaomilho/email_predictor.svg)](https://coveralls.io/r/joaomilho/email_predictor?branch=master)

Install
===

Clone the repo and bundle:

```bash
git clone git@github.com:joaomilho/email_predictor.git
cd email_predictor
bundle
```

Usage
===


```ruby
dataset = {
  "John Rawls"   => "john.rawls@princeton.edu",
  "Peter Singer" => "peter.singer@princeton.edu"
}

predictor = EmailPredictor::Predictor.new(dataset)

predictor.predict("Donald Davidson", "princeton.edu")
=> ["donald.davidson@princeton.edu"]

predictor.predict("Saul Kripke", "princeton.edu")
=> ["saul.kripke@princeton.edu"]

predictor.predict("Isaiah Berlin", "oxford.edu")
=> []
```

Design decisions
===

1. The structure of the code follows common gem conventions;
2. I decided to pre-parse the dataset, so you can instantiate a class and then test many predictions faster (see Usage);
3. The implementation makes easy to define new patterns, all you have to do is to create another class inside the module ```EmailPredictor::Patterns``` that define ```match?``` and ```format``` methods.
4. IMO the user only cares about the email he should try first. Therefore I decided to respond with a list of emails sorted by relevance. So the first email is equally or more likely to be the right email than the second one, the second equal or more than the third and so on.
5. When there are no matches returns empty instead of an exception. I started with exceptions, but it doesn't look it's an _unexpected_ case (see the book Exceptional Ruby).
6. There are probably many performance optimizations/caching still to be done.