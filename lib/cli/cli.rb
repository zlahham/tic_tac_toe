require 'colorize'
require 'curses'

module TicTacToe
  module CLI
    def self.term_width
      Curses.init_screen
      m_term_width = Curses.cols
      Curses.close_screen
      m_term_width
    end

    def self.clear
      Gem.win_platform? ? (system 'cls') : (system 'clear')
    end
  end
end
