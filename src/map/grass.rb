class Grass < Goby::Tile
  def initialize(passable: true, seen: false, description: "", events: [], monsters: [])
    @passable = passable
    @seen = seen
    @description = description
    @events = events
    @monsters = monsters
    @graphic = passable_graphic(passable)
  end

  private

  def default_graphic
    return "ǂ"
  end

  def passable_graphic(passable)
    passable ? default_graphic : '¥'
  end
end
