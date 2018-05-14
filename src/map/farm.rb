require_relative './grass'
# This is an example of how to create a Map. You can
# define the name, where to respawn, and the 2D display of
# the Map - each point is referred to as a Tile.
class Farm < Map
  def initialize
    super(name: "Farm")

    # Define the main tiles on this map.
    grass = Grass.new(description: "You are standing on some grass.")
    blocked_grass = Grass.new(passable: false)

    # Fill the map with "grass."
    @tiles = Array.new(9)

    normal_row = [grass, grass, grass, grass, grass]
    blocked_row = [grass, blocked_grass, blocked_grass, blocked_grass, grass]

    @tiles[0] = normal_row
    @tiles[1] = normal_row
    @tiles[2] = normal_row
    @tiles[3] = blocked_row
    @tiles[4] = blocked_row
    @tiles[5] = blocked_row
    @tiles[6] = normal_row
    @tiles[7] = normal_row
    @tiles[8] = normal_row

  end
end
