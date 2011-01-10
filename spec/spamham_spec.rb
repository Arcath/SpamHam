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
	
	it "Should return true for a sample comment" do
		ham = SpamHam.new.spam?("Superman/Batman Apocalypse review film where to download Superman/Batman Apocalypse <a href=http://connections.blackboard.com/people/3bb5b7ebfe>Superman/Batman Apocalypse wiki </a> download dvd Superman/Batman Apocalypse download Superman/Batman Apocalypse divx http://connections.blackboard.com/people/3bb5b7ebfe download The Confidant film The Confidant movie actors <a href=http://connections.blackboard.com/people/6289e3efc2>the The Confidant film </a> watch The Confidant online The Confidant hdtv http://connections.blackboard.com/people/6289e3efc2").should == true
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
