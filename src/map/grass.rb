class Grass < Goby::Tile
    def initialize(passable: true, seen: false, description: "", events: [], monsters: [])
      @passable = passable
      @seen = seen
      @description = description
      @events = events
      @monsters = monsters
      @graphic = default_graphic
    end

  def default_graphic
    return "ǂ"
  end
end
