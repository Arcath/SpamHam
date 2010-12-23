class SpamHam
	def wordlist
		[
			"viagra",
			"fake watches",
			"enlargement",
			"penis",
			"designer",
			"brands",
			"buy",
			"online slots",
			"valium",
			"ambien",
			"dosage",
			"propecia"
		] + (@config[:additional_words] || [])
	end
end
