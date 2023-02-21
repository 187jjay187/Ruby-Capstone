require './app'
require_relative './class/display_menu'

def main
  app = App.new
  loop do
    display_menu(app)
  end
end

main
