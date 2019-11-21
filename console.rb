require('pry')
require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

Casting.delete_all()
Star.delete_all()
Movie.delete_all()

star1 = Star.new({
  'first_name' => 'Julia',
  'last_name' => 'Roberts',
  'fee' => 50
})

star2 = Star.new({
  'first_name' => 'Richard',
  'last_name' => 'Gere',
  'fee' => 70
})

star3 = Star.new({
  'first_name' => 'Jeff',
  'last_name' => 'Bridges',
  'fee' => 40
})

star1.save()
star2.save()
star3.save()

movie1 = Movie.new({
  'title' => 'Pretty Woman',
  'genre' => 'Rom Com',
  'budget' => 400
  })

  movie2 = Movie.new({
    'title' => 'The Big Labowski',
    'genre' => 'Comedy',
    'budget' => 300
    })

    movie3 = Movie.new({
      'title' => 'The Runaway Bride',
      'genre' => 'Rom Com',
      'budget' => 600
      })

movie1.save()
movie2.save()
movie3.save()


casting1 = Casting.new({
  'movie_id' => movie1.id,
  'star_id' => star1.id
  })

casting2 = Casting.new({
    'movie_id' => movie1.id,
    'star_id' => star2.id})


casting3 = Casting.new({
        'movie_id' => movie3.id,
        'star_id' => star1.id
        })

casting4 = Casting.new({
            'movie_id' => movie3.id,
            'star_id' => star2.id
            })
casting5 = Casting.new({
                'movie_id' => movie2.id,
                'star_id' => star3.id
                })

casting1.save()
casting2.save()
casting3.save()
casting4.save()
casting5.save()

binding.pry

nil
