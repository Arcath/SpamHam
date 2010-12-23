class SpamHam
	def conf(config = nil)
		@config = config || {}
		load_config_from_defaults
		if File.exist?("config/spamham.rb")
			load_config_from_file
		end
	end

	private
	
	def load_config_from_file
		load 'config/spamham.rb'
		user_config
	end

	#Sets and unset values to thier defaults
	def load_config_from_defaults
		@config[:trigger_weight] ||= 30
		@config[:link_weight] ||= 10
		@config[:link_multiple] ||= 1.1
		@config[:multiple_link_style_weight] ||= 20
		@config[:link_styles] ||= [/<a href="(.*?)">(.*?)<\/a>/,/\[url=(.*?)\](.*?)\[\/url\]/]
	end
end
