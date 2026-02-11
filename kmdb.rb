Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Agent.destroy_all

studio = Studio.new
studio["studio_name"] = "Warner Bros."
studio.save

warner_bros = Studio.find_by({"studio_name" => "Warner Bros."})

movie = Movie.new
movie["movie_name"] = "Batman Begins"
movie["release_year"] = 2005
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["movie_name"] = "The Dark Knight"
movie["release_year"] = 2008
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["movie_name"] = "The Dark Knight Rises"
movie["release_year"] = 2012
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

batman_begins = Movie.find_by({"movie_name" => "Batman Begins"})
dark_knight = Movie.find_by({"movie_name" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({"movie_name" => "The Dark Knight Rises"})

agent = Agent.new
agent["agent_name"] = "Daniel Cutright"
agent.save

daniel_cutright = Agent.find_by({"agent_name" => "Daniel Cutright"})

actor = Actor.new
actor["actor_name"] = "Christian Bale"
actor["agent_id"] = daniel_cutright["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["actor_name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["actor_name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["actor_name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor["actor_name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["actor_name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["actor_name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor["actor_name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["actor_name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["actor_name"] = "Anne Hathaway"
actor.save

christian_bale = Actor.find_by({"actor_name" => "Christian Bale"})
michael_caine = Actor.find_by({"actor_name" => "Michael Caine"})
liam_neeson = Actor.find_by({"actor_name" => "Liam Neeson"})
katie_holmes = Actor.find_by({"actor_name" => "Katie Holmes"})
gary_oldman = Actor.find_by({"actor_name" => "Gary Oldman"})
heath_ledger = Actor.find_by({"actor_name" => "Heath Ledger"})
aaron_eckhart = Actor.find_by({"actor_name" => "Aaron Eckhart"})
maggie_gyllenhaal = Actor.find_by({"actor_name" => "Maggie Gyllenhaal"})
tom_hardy = Actor.find_by({"actor_name" => "Tom Hardy"})
joseph_gordon_levitt = Actor.find_by({"actor_name" => "Joseph Gordon-Levitt"})
anne_hathaway = Actor.find_by({"actor_name" => "Anne Hathaway"})

role = Role.new
role["role_name"] = "Bruce Wayne"
role["actor_id"] = christian_bale["id"]
role["movie_id"] = batman_begins["id"]
role.save

role = Role.new
role["role_name"] = "Alfred"
role["actor_id"] = michael_caine["id"]
role["movie_id"] = batman_begins["id"]
role.save

role = Role.new
role["role_name"] = "Ra's Al Ghul"
role["actor_id"] = liam_neeson["id"]
role["movie_id"] = batman_begins["id"]
role.save

role = Role.new
role["role_name"] = "Rachel Dawes"
role["actor_id"] = katie_holmes["id"]
role["movie_id"] = batman_begins["id"]
role.save

role = Role.new
role["role_name"] = "Commissioner Gordon"
role["actor_id"] = gary_oldman["id"]
role["movie_id"] = batman_begins["id"]
role.save

role = Role.new
role["role_name"] = "Bruce Wayne"
role["actor_id"] = christian_bale["id"]
role["movie_id"] = dark_knight["id"]
role.save

role = Role.new
role["role_name"] = "Joker"
role["actor_id"] = heath_ledger["id"]
role["movie_id"] = dark_knight["id"]
role.save

role = Role.new
role["role_name"] = "Harvey Dent"
role["actor_id"] = aaron_eckhart["id"]
role["movie_id"] = dark_knight["id"]
role.save

role = Role.new
role["role_name"] = "Alfred"
role["actor_id"] = michael_caine["id"]
role["movie_id"] = dark_knight["id"]
role.save

role = Role.new
role["role_name"] = "Rachel Dawes"
role["actor_id"] = maggie_gyllenhaal["id"]
role["movie_id"] = dark_knight["id"]
role.save

role = Role.new
role["role_name"] = "Bruce Wayne"
role["actor_id"] = christian_bale["id"]
role["movie_id"] = dark_knight_rises["id"]
role.save

role = Role.new
role["role_name"] = "Commissioner Gordon"
role["actor_id"] = gary_oldman["id"]
role["movie_id"] = dark_knight_rises["id"]
role.save

role = Role.new
role["role_name"] = "Bane"
role["actor_id"] = tom_hardy["id"]
role["movie_id"] = dark_knight_rises["id"]
role.save

role = Role.new
role["role_name"] = "John Blake"
role["actor_id"] = joseph_gordon_levitt["id"]
role["movie_id"] = dark_knight_rises["id"]
role.save

role = Role.new
role["role_name"] = "Selina Kyle"
role["actor_id"] = anne_hathaway["id"]
role["movie_id"] = dark_knight_rises["id"]
role.save

puts "Movies"
puts "======"
puts ""

movies = Movie.all

for movie in movies
  studio = Studio.find(movie["studio_id"])
  puts movie["movie_name"].ljust(25) + movie["release_year"].to_s.ljust(10) + movie["mpaa_rating"].ljust(10) + studio["studio_name"].ljust(10)
end

puts ""
puts "Top Cast"
puts "========"
puts ""

roles = Role.all

for role in roles
  movie = Movie.find(role["movie_id"])
  actor = Actor.find(role["actor_id"])
  puts movie["movie_name"].ljust(25) + actor["actor_name"].ljust(25) + role["role_name"].ljust(25)
end

puts ""
puts "Represented by agent"
puts "===================="
puts ""

actors = Actor.all

for actor in actors
  agent_id = actor["agent_id"]
    if agent_id == daniel_cutright["id"]
      puts actor["actor_name"].ljust(25)
    end
end