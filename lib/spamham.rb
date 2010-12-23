require 'spamham/configure.rb'
require 'spamham/scan.rb'
require 'spamham/string.rb'
require 'spamham/wordlist.rb'

class SpamHam
	def initialize
		self.conf
	end

	def spam?(string)
		@string=string
		self.scan
		@string=nil
		@string_weight >= @config[:trigger_weight]
	end
	
	def weight
		@string_weight
	end
end
