def get_first_name_of_season_winner(data, season)
	roster = data.fetch("#{season.to_sym}")
	roster.each do |person|
		return person["name"].split(" ")[0] if person["status"] == "Winner"
	end
end

def get_contestant_name(data, occupation)
	data.each do |show, roster|
		roster.each do |person|
			return person["name"] if person["occupation"] == occupation
		end	
	end	
end

def count_contestants_by_hometown(data, hometown)
	count = 0
	data.each do |show, roster|
		roster.each {|person| count += 1 if person["hometown"] == hometown}
	end	
	count
end

def get_occupation(data, hometown)
	data.each do |show, roster|
		roster.each do |person|
			return person["occupation"] if person["hometown"] == hometown
		end	
	end	
end

def get_average_age_for_season(data, season)
	total_age = 0
	roster = data.fetch("#{season.to_sym}")
	roster.each {|person| total_age += person["age"].to_f}
	(total_age / roster.size).round
end