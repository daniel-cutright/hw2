class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string "movie_name"
      t.integer "release_year"
      t.string "mpaa_rating"
      t.integer "studio_id"

      t.timestamps
    end
  end
end
