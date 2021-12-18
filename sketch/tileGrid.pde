
final int TEST_CELL = 255;
final int INVISIBLE_WALL = 253;
final int DOUBLE_WALL_VERTICAL_LEFT = 186;
final int DOUBLE_WALL_VERTICAL_RIGHT = 189;
final int DOUBLE_WALL_HORIZONTAL_TOP = 205;
final int DOUBLE_WALL_HORIZONTAL_BOTTOM = 193;
final int DOUBLE_CORNER_TOP_LEFT = 201;
final int DOUBLE_CORNER_TOP_RIGHT = 187;
final int DOUBLE_CORNER_BOTTOM_LEFT = 200;
final int DOUBLE_CORNER_BOTTOM_RIGHT = 188;
final int DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_LEFT = 206;
final int DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_RIGHT = 207;
final int DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_BOTTOM_LEFT = 208;
final int DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_TOP_LEFT = 209;
final int DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_BOTTOM_RIGHT = 210;
final int DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_TOP_RIGHT = 211;
final int SIMPLE_WALL_VERTICAL_LEFT = 179;
final int SIMPLE_WALL_VERTICAL_RIGHT = 190;
final int SIMPLE_WALL_HORIZONTAL_TOP = 196;
final int SIMPLE_WALL_HORIZONTAL_BOTTOM = 194;
final int SIMPLE_CORNER_TOP_LEFT = 218;
final int SIMPLE_CORNER_TOP_RIGHT = 191;
final int SIMPLE_CORNER_BOTTOM_LEFT = 192;
final int SIMPLE_CORNER_BOTTOM_RIGHT = 217;
final int SIMPLE_CONVEX_CORNER_TOP_LEFT = 219;
final int SIMPLE_CONVEX_CORNER_TOP_RIGHT = 220;
final int SIMPLE_CONVEX_CORNER_BOTTOM_LEFT = 221;
final int SIMPLE_CONVEX_CORNER_BOTTOM_RIGHT = 222;

final int PELLET = 250;
final int POWER_PELLET = 254;
final int CORRIDOR = 32;

final int PACMAN_TYPE = 166;
final int RED_GHOST_TYPE = 167;
final int PINK_GHOST_TYPE = 168;
final int BLUE_GHOST_TYPE = 169;
final int ORANGE_GHOST_TYPE = 170;

final int[] allWallTypes = new int[] {
  DOUBLE_CORNER_TOP_LEFT,
  DOUBLE_CORNER_TOP_RIGHT,
  DOUBLE_CORNER_BOTTOM_LEFT,
  DOUBLE_CORNER_BOTTOM_RIGHT,
  DOUBLE_WALL_VERTICAL_LEFT,
  DOUBLE_WALL_VERTICAL_RIGHT,
  DOUBLE_WALL_HORIZONTAL_TOP,
  DOUBLE_WALL_HORIZONTAL_BOTTOM,
  DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_LEFT,
  DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_RIGHT,
  DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_BOTTOM_LEFT,
  DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_TOP_LEFT,
  DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_BOTTOM_RIGHT,
  DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_TOP_RIGHT,
  SIMPLE_CORNER_TOP_LEFT,
  SIMPLE_CORNER_TOP_RIGHT,
  SIMPLE_CORNER_BOTTOM_LEFT,
  SIMPLE_CORNER_BOTTOM_RIGHT,
  SIMPLE_WALL_VERTICAL_LEFT,
  SIMPLE_WALL_VERTICAL_RIGHT,
  SIMPLE_WALL_HORIZONTAL_TOP,
  SIMPLE_WALL_HORIZONTAL_BOTTOM,
  SIMPLE_CONVEX_CORNER_TOP_LEFT,
  SIMPLE_CONVEX_CORNER_TOP_RIGHT,
  SIMPLE_CONVEX_CORNER_BOTTOM_LEFT,
  SIMPLE_CONVEX_CORNER_BOTTOM_RIGHT,
  INVISIBLE_WALL
};

class TileGrid {
  int[][] grid;

  TileGrid () {  
    grid = new int[MAX_ROWS][MAX_COLS];
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        cleanTile(x, y);
      }
    }
  }

  void renderGrid() {
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        drawStage(x, y);
        drawCharacters(x, y);
      }
    }
  }

  void refreshGrid() {
    for(Creature creature : creatures) {
      cleanPreviousPosition(creature);
    }
    for(Ghost ghost : ghosts) {
      ghost.showTarget();
    }
    for(Creature creature : creatures) {
      creature.drawYourSelf();
    }
  }

  void cleanPreviousPosition(Creature creature) {
    int currentXgrid = creature.getGridCellX();
    int currentYgrid = creature.getGridCellY();
    cleanSection((currentXgrid - 1), (currentXgrid + 1), (currentYgrid - 1), (currentYgrid + 1));
  }

  void cleanCell(int x, int y) {
    cleanSection(x, x, y, y);
  }
  
  void cleanSection(int fromX, int toX, int fromY, int toY) {

    fromX = validateCoordinate(fromX, MAX_COLS);
    toX = validateCoordinate(toX, MAX_COLS);
    fromY = validateCoordinate(fromY, MAX_ROWS);
    toY = validateCoordinate(toY, MAX_ROWS);

    for(int x = fromX; x <= toX; x++) {
      for(int y = fromY; y <= toY; y++) {
        drawStage(x, y);
      }
    }
  }

  void drawStage(int x, int y) {
    if (isWall(x, y)) {
      drawBlueWallInCellGrid(x, y, getTileValue(x, y));
    } else {
      switch (getTileValue(x, y)) {
        case INVISIBLE_WALL:
          drawInvisibleWallInCellGrid(x, y);
          break;
        case CORRIDOR:
          drawCorridorInCellGrid(x, y);
          break;
        case PELLET:
          drawPelletInCellGrid(x, y);
          break;
        case POWER_PELLET:
          drawPowerPelletInCellGrid(x, y);
          break;
      }
    }
  }

  void drawCharacters(int x, int y) {
    switch (getTileValue(x, y)) {
      case PACMAN_TYPE:
        pacman = new Pacman(convertToCoordInCellCenter(x), convertToCoordInCellCenter(y));
        creatures.add(pacman);
        setCorridor(pacman); // Once Pacman has spawn, we clean its mark in the corridor.
        break;
      case RED_GHOST_TYPE:
        red = new Red(convertToCoordInCellCenter(x), convertToCoordInCellCenter(y));
        creatures.add(red);
        ghosts.add(red);
        setCorridor(red); // Once ghost has spawn, we clean its mark in the corridor.
        break;
      case PINK_GHOST_TYPE:
        pink = new Pink(convertToCoordInCellCenter(x), convertToCoordInCellCenter(y));
        creatures.add(pink);
        ghosts.add(pink);
        setCorridor(pink); // Once ghost has spawn, we clean its mark in the ghosts house.
        break;
      case BLUE_GHOST_TYPE:
        blue = new Blue(convertToCoordInCellCenter(x), convertToCoordInCellCenter(y));
        creatures.add(blue);
        ghosts.add(blue);
        setCorridor(blue); // Once ghost has spawn, we clean its mark in the ghosts house.
        break;
      case ORANGE_GHOST_TYPE:
        orange = new Orange(convertToCoordInCellCenter(x), convertToCoordInCellCenter(y));
        creatures.add(orange);
        ghosts.add(orange);
        setCorridor(orange); // Once ghost has spawn, we clean its mark in the ghosts house.
        break;
    }
  }

  int validateCoordinate(int coordinate, int maxValue) {
    if (coordinate < 0) {
      coordinate = 0;
    } else if (coordinate >= maxValue) {
      coordinate = maxValue - 1;
    }
    return coordinate;
  }

  void setCorridor(Creature creature) {
    setTileValue(creature.getGridCellX(), creature.getGridCellY(), CORRIDOR);
  }

  // Movement is only validated when creature is in the center of the cell.
  boolean isNotWallOnCreatureLeft(Creature creature) {
    return !isHorizontalCenterOfTheCell(creature) || !isWall(creature.getGridCellX()-1, creature.getGridCellY());
  }

  boolean isNotWallOnCreatureRight(Creature creature) {
    return !isHorizontalCenterOfTheCell(creature) || !isWall(creature.getGridCellX()+1, creature.getGridCellY());
  }

  boolean isNotWallOnCreatureUp(Creature creature) {
    return !isVerticalCenterOfTheCell(creature) || !isWall(creature.getGridCellX(), creature.getGridCellY()-1);
  }

  boolean isNotWallOnCreatureDown(Creature creature) {
    return !isVerticalCenterOfTheCell(creature) || !isWall(creature.getGridCellX(), creature.getGridCellY()+1);
  }

  boolean isPellet(Creature creature) {
    return isPellet(creature.getGridCellX(), creature.getGridCellY());
  }

  boolean isPowerPellet(Creature creature) {
    return isPowerPellet(creature.getGridCellX(), creature.getGridCellY());
  }

  boolean isWall(int x, int y) {
    int gridValue = getTileValue(x, y);
    for (int i = 0; i < allWallTypes.length; i++) {
      if (gridValue == allWallTypes[i]) {
        return true;
      }
    }
    return false;
  }

  boolean isPellet(int x, int y) {
    return getTileValue(x, y) == PELLET;
  }

  boolean isPowerPellet(int x, int y) {
    return getTileValue(x, y) == POWER_PELLET;
  }

  // Checks if coord is the center of the cell
  boolean isCenterOfTheCell(Creature creature) {
    return isHorizontalCenterOfTheCell(creature) && isVerticalCenterOfTheCell(creature);
  }

  boolean isHorizontalCenterOfTheCell(Creature creature) {
    return isCenterInOneDimensionOfTheCell(creature.getDrawX());
  }

  boolean isVerticalCenterOfTheCell(Creature creature) {
    return isCenterInOneDimensionOfTheCell(creature.getDrawY());
  }

  boolean isCenterInOneDimensionOfTheCell(int coord) {
    return coord == cuantizeCoord(coord) + (CELL_SIZE / 2);
  }

  void cleanTile(int x, int y) {
    setTileValue(x, y, 0);
  }

  void debug() {
    println("Grid content:");
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        if (getTileValue(x, y) < 100) {
          print(" " + getTileValue(x, y) + " ");
        } else {
          print(getTileValue(x, y) + " ");
        }
      }
      println("");
    }
  }

  int getTileValue(int x, int y) {
    return grid[y][x];
  } 

  void setTileValue(int x, int y, int value) {
    grid[y][x] = value;
  }
}
