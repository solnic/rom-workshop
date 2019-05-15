require_relative "spec_helper"

# Load our exercises so we can test the code we've been playing with

require_relative "../run"
Persistence.reset_with_migration(MIGRATION)
Persistence.finalize

# Set up rom-factory

require "rom-factory"

Factory = ROM::Factory.configure do |config|
  config.rom = Persistence.rom
end

Dir[Pathname(__dir__).join("factories/**/*.rb")].each(&method(:require))
