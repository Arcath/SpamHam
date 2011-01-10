class SpamHam
	def wordlist
		YAML.load_file(File.dirname(__FILE__) + "/wordlist.yml")["words"] + (@config[:additional_words] || [])
	end
end
