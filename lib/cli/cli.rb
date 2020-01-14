# typed: strict
# frozen_string_literal: true

require 'colorize'
require 'curses'

module TicTacToe
  module CLI
    extend T::Sig

    sig {returns(T.nilable(JSON::Ext::Generator::GeneratorMethods::Integer))}
    def self.term_width
      Curses.init_screen
      m_term_width = Curses.cols
      Curses.close_screen
      m_term_width
    end

    sig {returns(T.nilable(T::Boolean))}
    def self.clear
      Gem.win_platform? ? (system 'cls') : (system 'clear')
    end
  end
end
