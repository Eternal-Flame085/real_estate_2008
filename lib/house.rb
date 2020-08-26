class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price >= "$500000"
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    area = 0
    @rooms.each do |room|
      area += room.area
    end
    area
  end

  def details
    {"price" => @price.split("$")[1].to_i, "address" => @address}
  end

  def test_price_per_square_foot
    (@price.split("$")[1].to_f / area).round(2)
  end

  def rooms_by_category
    rooms = Hash.new

    @rooms.each do |room|
      if !rooms.key?(room.category) && rooms_from_category(room.category).length > 1
        rooms[room.category] = rooms_from_category(room.category)
      else
        rooms[room.category] = rooms_from_category(room.category)
      end
    end
    rooms
  end
end
