require_relative('../db/sql_runner')

class Star

  attr_accessor :first_name, :last_name, :fee
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
    @fee = details['fee'].to_i()
  end

  def save()
    sql = "INSERT INTO stars (first_name, last_name, fee) VALUES ($1, $2, $3) RETURNING id"
    values = [@first_name, @last_name, @fee]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM stars"
    stars = SqlRunner.run(sql)
    return movies.map {|star| Star.new(movie)}
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def select_movie()
    sql = "SELECT movies.* FROM movies INNER JOIN castings ON movies.id = movie_id
    WHERE star_id = $1"
    values = [@id]
    movies = SqlRunner.run(sql, values)
    return result = movies.map{|movie| Movie.new(movie)}
  end

end
