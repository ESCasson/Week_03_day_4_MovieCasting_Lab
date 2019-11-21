require_relative('../db/sql_runner')

class Movie

 attr_accessor :title, :genre, :budget
 attr_reader :id

 def initialize(details)
   @id = details['id'].to_i() if details['id']
   @title = details['title']
   @genre = details['genre']
   @budget = details['budget']
 end

 def save()
   sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
   values = [@title, @genre, @budget]
   result = SqlRunner.run(sql, values)
   @id = result[0]['id'].to_i()
 end

 def self.all()
   sql = "SELECT * FROM movies"
   movies = SqlRunner.run(sql)
   return movies.map {|movie| Movie.new(movie)}
 end

 def self.delete_all()
   sql = "DELETE FROM movies"
   SqlRunner.run(sql)
 end

def select_stars()
  sql = "SELECT stars.* FROM stars INNER JOIN castings ON star_id = stars.id
  WHERE movie_id = $1"
  values = [@id]
  stars = SqlRunner.run(sql, values)
  return result = stars.map{|star| Star.new(star)}
end

def add_fees_of_cast()
  fees = select_stars.map{|star| star.fee }
  return fees.sum()
end

def delete_cast_fees_from_budget()
  update_fees = @budget - add_fees_of_cast()
  sql = "UPDATE movies SET budget = $1 WHERE id = $2"
  values = [update_fees, @id]
  SqlRunner.run(sql, values)
end


end
