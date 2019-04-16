require './lib/commandline_handler'

message, file, key, date = ARGV
CommandLineHandler.convert_message(:encryption, message, file, key, date)
