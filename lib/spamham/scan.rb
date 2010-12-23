class SpamHam
	def scan
		@string_weight = 0
		build_link_weights
		build_word_list_weights
	end

	private

	def build_link_weights
		links.each do |linkstyle|
			linkstyle.each do |link|
				@string_weight = @string_weight + (@config[:link_weight] * (@config[:link_multiple] * (linkstyle.index(link) + 1)))
			end
		end
		@string_weight = @string_weight + @config[:multiple_link_style_weight] if links.size >= 2
	end
	
	def links
		matched_links = []
		@config[:link_styles].each do |style|
			matched_links.push(@string.scan(style)) unless @string.scan(style) == [] and matched_links.index(@string.scan(style)) != nil
		end
		matched_links
	end

	def build_word_list_weights
		wordlist.each do |word|
			@string_weight = @string_weight + (@string.scan(/#{word}/).count)
		end
	end
end
