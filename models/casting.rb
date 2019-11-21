require_relative('../db/sql_runner')

class Casting
  attr_accessor :movie_id, :star_id
  attr_reader :id

def initialize(details)
   @id = details['id'].to_i() if details['id']
   @movie_id = details['movie_id'].to_i()
   @star_id = details['star_id'].to_i()
end

def save()
  sql = "INSERT INTO castings (movie_id, star_id) VALUES ($1, $2) RETURNING id"
  values = [@movie_id, @star_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i()
end

def self.all()
  sql = "SELECT * FROM castings"
  castings = SqlRunner.run(sql)
  return castings.map {|cast| Casting.new(cast)}
end

def self.delete_all()
  sql = "DELETE FROM castings"
  SqlRunner.run(sql)
end



end
