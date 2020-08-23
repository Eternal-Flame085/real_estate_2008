# Real Estate

## Setup Instructions (for Instructors)

* Clone this repo
* remove the turingschool remote
* remove the git history and initialize a new git repo (`rm -rf .git && git init`)
* commit the room_test.rb, room.rb, and the `##Instructions` from the README, for students.
* create a branch called `spec`
* commit the Gemfile, spec directory, and, optionally, the remainder of the README
* Create a new repo on turingschool-examples called `real_estate_<cohort number>`
* Add that remote
* Push up both branches


### Spec Harness Instructions

In order to run the spec harness, first create a directory with a `students.txt` file.

In `students.txt`, put a list of your students Github handles.  For example:

```
aziobrow
dionew1
memcmahon
s-espinosa
```

From the command line, run the following script, replacing `<repository_name` with the name of the challenge repo:

```
for i in `cat students.txt`; do
  git clone git@github.com:$i/<repository_name> $i
  cd $i
  git pull origin spec # this will cause a merge commit message
  rspec
  echo
  echo
  read -p 'Press Enter to continue'
  cd ..
done
```

## Instructions

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
  * Make sure to put your name in your PR!

## Iteration 1

Start with the three existing tests, and then use TDD to create a `Room` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/room'
#=> true

pry(main)> room = Room.new(:bedroom, 10, "13")
#=> #<Room:0x00007fa53b9ca0a8 @category=:bedroom, @length=10, @width="13">

pry(main)> room.category
#=> :bedroom

pry(main)> room.area
#=> 130

pry(main)> room.is_painted?
#=> false

pry(main)> room.paint

pry(main)> room.is_painted?
#=> true
```

## Iteration 2

Use TDD to create a `House` class that responds to the following interaction pattern:
    * Where you see something like `#<House:0x00007fccd30375f8...>`, this is shorthand for a full house object with that object identifier - we have replaced any attributes with `...` for readability.

```ruby
pry(main)> require './lib/room'
#=> true

pry(main)> require './lib/house'
#=> true

pry(main)> house = House.new("$400000", "123 sugar lane")
#=> #<House:0x00007fccd30375f8...>

pry(main)> house.price
#=> 400000

pry(main)> house.address
#=> "123 sugar lane"

pry(main)> house.rooms
#=> []

pry(main)> room_1 = Room.new(:bedroom, 10, '13')
#=> #<Room:0x00007fccd29b5720...>

pry(main)> room_2 = Room.new(:bedroom, 11, '15')
#=> #<Room:0x00007fccd2985f48...>

pry(main)> house.add_room(room_1)

pry(main)> house.add_room(room_2)

pry(main)> house.rooms
#=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]
```

## Iteration 3

Use TDD to update your `House` class so that it responds to the following interaction pattern.
    * A house is `above_market_average` if its price is greater than $500,000.

```ruby
pry(main)> require './lib/room'
#=> true

pry(main)> require './lib/house'
#=> true

pry(main)> house = House.new("$400000", "123 sugar lane")
#=> #<House:0x00007fccd30375f8...>

pry(main)> house.above_market_average?
#=> false

pry(main)> room_1 = Room.new(:bedroom, 10, '13')
#=> #<Room:0x00007fccd29b5720...>

pry(main)> room_2 = Room.new(:bedroom, 11, '15')
#=> #<Room:0x00007fccd2985f48...>

pry(main)> room_3 = Room.new(:living_room, 25, '15')
#=> #<Room:0x00007fccd383c2d0...>

pry(main)> room_4 = Room.new(:basement, 30, '41')
#=> #<Room:0x00007fccd297dc30...>

pry(main)> house.add_room(room_1)

pry(main)> house.add_room(room_2)

pry(main)> house.add_room(room_3)

pry(main)> house.add_room(room_4)

pry(main)> house.rooms_from_category(:bedroom)
#=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]

pry(main)> house.rooms_from_category(:basement)
#=> [#<Room:0x00007fccd297dc30...>]

pry(main)> house.area
#=> 1900

pry(main)> house.details
#=> {"price" => 400000, "address" => "123 sugar lane"}
```

## Iteration 4

Use TDD to update your `House` class so that it responds to the following interaction pattern:

```ruby
pry(main)> require './lib/room'
#=> true

pry(main)> require './lib/house'
#=> true

pry(main)> house = House.new("$400000", "123 sugar lane")
#=> #<House:0x00007fccd30375f8...>

pry(main)> room_1 = Room.new(:bedroom, 10, '13')
#=> #<Room:0x00007fccd29b5720...>

pry(main)> room_2 = Room.new(:bedroom, 11, '15')
#=> #<Room:0x00007fccd2985f48...>

pry(main)> room_3 = Room.new(:living_room, 25, '15')
#=> #<Room:0x00007fccd383c2d0 @category=:living_room, @length=25, @width=15>

pry(main)> room_4 = Room.new(:basement, 30, '41')
#=> #<Room:0x00007fccd297dc30 @category=:basement, @length=30, @width=41>

pry(main)> house.add_room(room_4)

pry(main)> house.add_room(room_1)

pry(main)> house.add_room(room_3)

pry(main)> house.add_room(room_2)

pry(main)> house.price_per_square_foot
#=> 210.53

pry(main)> house.rooms_sorted_by_area
#=> [#<Room:0x00007fccd297dc30...>, #<Room:0x00007fccd383c2d0...>, #<Room:0x00007fccd2985f48...>, #<Room:0x00007fccd29b5720...>]

pry(main)> house.rooms_by_category
#=> {:bedroom=>[#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>], :living_room=> [#<Room:0x00007fccd383c2d0...>], :basement=> [#<Room:0x00007fccd297dc30...>]}
```
