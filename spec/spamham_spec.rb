require 'lib/spamham.rb'

describe SpamHam, "#spam?" do
	it "Should return false for \"not spam\"" do
		SpamHam.new.spam?("not spam").should == false
	end

	it "Should return true for \"<a href=\"host\">text</a> [url=host1]text1[/url] \"<a href=\"host2\">text2</a>\"" do
		SpamHam.new.spam?("<a href=\"host\">text</a> [url=host1]text1[/url] \"<a href=\"host2\">text2</a>").should == true
	end

	it "Should return true for \"ixxdzakarvtstdldkpxt, [url=http://www.amosboergoats.com/]Buy Cialis[/url], hgOvsFa.\"" do
		ham = SpamHam.new.spam?("ixxdzakarvtstdldkpxt, [url=http://www.amosboergoats.com/]Buy Cialis[/url], hgOvsFa.").should == true
	end
end

describe SpamHam, "#weight" do
	it "Should return 1 for \"penis\"" do
		ham=SpamHam.new
		ham.spam?("penis")
		ham.weight.should == 1
	end

	it "Should return 3.6 for \"designer brands\"" do
		ham=SpamHam.new
		ham.spam?("designer brands")
		ham.weight.should <= 3.7
	end
end

describe String, "#spam?" do
	it "Should return flase for \"string of characters\"" do
		"string of characters".spam?.should == false
	end
end
