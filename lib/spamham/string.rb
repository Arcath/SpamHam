class String
	# Adds .spam? to strings
	#
	# Takes configuration options
	def spam?(config = nil)
		spam=SpamHam.new
		spam.conf(config) if config
		spam.spam?(self)
	end
end
