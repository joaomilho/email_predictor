require 'email_predictor/hash'
require 'email_predictor/string'

module EmailPredictor
  autoload :Dataset,   'email_predictor/dataset'
  autoload :Email,     'email_predictor/email'
  autoload :Predictor, 'email_predictor/predictor'
  autoload :Pattern,   'email_predictor/pattern'
  autoload :Patterns,  'email_predictor/patterns'
end
