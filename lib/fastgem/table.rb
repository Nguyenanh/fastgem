require 'terminal-table'
require 'rainbow'
module Fastgem
  class Table
    def initialize
      @table = Terminal::Table.new headings: %w(Name Downloads GEMFILE LinkGithub)
      @table.align_column(0,:right)
    end

    def format(result)
      row = []
      row << Rainbow("#{result['name']}").color(:green)
      row << result['downloads']
      row << "gem '#{result['name']}', '#{result['version']}'"
      row << Rainbow(result['homepage_uri']).color(:blue)
      @table << row
    end

    def after
      puts @table.to_s
    end
  end
end