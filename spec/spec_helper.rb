require 'coveralls'
Coveralls.wear!

require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/extensions.rb'
require_relative '../lib/minimax.rb'
require_relative '../lib/players/player.rb'
require 'colorize'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
