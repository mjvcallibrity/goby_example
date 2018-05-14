So let's start with the basics. The first thing you are going to need when building
your game is a map. In Goby, a map is composed of several Tiles (instances of the
Tile class), so it is important to first understand how a Tile works.

When initializing a new Tile, it is possible to simply call `Tile.new` without any
arguments. Doing so will create a instance of Tile that has the following basic
default attributes:

- It will be passable (@passable === true)
- It won't be seen (@seen === false)
- It will have a blank description (@description === "")
- It will have no events (@events === [])
- It will have no monsters (@monsters === [])
- It will use the default graphic (@graphic === ".")

Many of these attributes mean nothing now, and we will get to them, but let's focus
on the simplest way in which we can extend this class. The defaults of the Tile class
can be thought of as representing unremarkable blank space on your map. But what if
we wanted to create a grassy meadow? That is where extending the `Goby::Tile` class
comes in. Here is a small example:

```
class Grass < Goby::Tile
  def initialize(passable: true, seen: false, description: "", events: [], monsters: [])
    @passable = passable
    @seen = seen
    @description = description
    @events = events
    @monsters = monsters
    @graphic = default_graphic
  end

  private

  def default_graphic
    return "ǂ"
  end
end
```

Here, we extend the `Goby::Tile` class, and replace the behavior of the
`#default_graphic` method, so that it returns a different unicode symbol. We also
make a change to the constructor so that `@graphic` is set to the unicode symbol
returned from the invocation of `#default_graphic`. Now, when we instantiate an
object of type `Grass`, and include it into our map, that tile will be represented by
the `ǂ` character. This will provide a bit more visual context to the player of where
they are on the map.

So now let's say we want to customize this Grass tile a bit further by creating a
grass tile that is not passable. We could create a new class called something like
`BlockedGrass`, or we could further customize our existing `Grass` class. Let's go
with the latter for now.

```
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
    passable ? default_graphic : "¥"
  end
end
```

So here what we've done is added another private method called `#passable_graphic`.
This method is responsible for setting the `@graphic` property of the `Grass`
instance. When an instance is created that is passable, the "ǂ" character will
represent that tile, but when an instance is created that is not passable, the "¥"
character will be displayed instead.
