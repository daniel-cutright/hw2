# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Agent.destroy_all

# Generate models and tables, according to the domain model.
# DONE

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
studio = Studio.new
studio["studio_name"] = "Warner Bros."
studio.save

puts "Studios: #{Studio.all.count}"

warner_bros = Studio.find_by({"studio_name" => "Warner Bros."})

movie = Movie.new
movie["movie_name"] = "Batman Begins"
movie["release_year"] = 2005
movie["MPAA_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["movie_name"] = "The Dark Knight"
movie["release_year"] = 2008
movie["MPAA_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["movie_name"] = "The Dark Knight Rises"
movie["release_year"] = 2012
movie["MPAA_rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

puts "Movies: #{Movie.all.count}"

batman_begins = Movie.find_by({"movie_name" => "Batman Begins"})
dark_knight = Movie.find_by({"movie_name" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({"movie_name" => "The Dark Knight Rises"})

agent = Agent.new
agent["agent_name"] = "Daniel Cutright"
agent.save

puts "Agents: #{Agent.all.count}"

daniel_cutright = Agent.find_by({"agent_name" => "Daniel Cutright"})

actor = Actor.new
actor["actor_name"] = "Christian Bale"
actor["agent_id"] = daniel_cutright["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Michael Cane"
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

puts "Actors: #{Actor.all.count}"

christian_bale = Actor.find_by({"actor_name" => "Christian Bale"})
michael_cane = Actor.find_by({"actor_name" => "Michael Cane"})
liam_neeson = Actor.find_by({"actor_name" => "Liam Neeson"})
katie_holmes = Actor.find_by({"actor_name" => "Katie Holmes"})
gary_oldman = Actor.find_by({"actor_name" => "Gary Oldman"})
heath_ledger = Actor.find_by({"actor_name" => "Heath Ledger"})
aaron_eckhart = Actor.find_by({"actor_name" => "Aaron Eckhart"})
maggie_gyllenhaal = Actor.find_by({"actor_name" => "Maggie Gyllenhaal"})
tom_hardy = Actor.find_by({"actor_name" => "Tom Hardy"})
joseph_gordon_levitt = Actor.find_by({"actor_name" => "Joseph Gordon-Levitt"})
anne_hathaway = Actor.find_by({"actor_name" => "Anne Hathaway"})

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
