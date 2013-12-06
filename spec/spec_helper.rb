Dir["./spec/support/**/*.rb"].each { |f| require f }
Dir["./lib/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
end