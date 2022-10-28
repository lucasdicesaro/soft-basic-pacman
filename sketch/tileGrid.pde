
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

final int UP_RESTRICTED_POSITION_WITH_PELLET = 212;
final int UP_RESTRICTED_POSITION_WITHOUT_PELLET = 213;

final int TUNNEL_BOUNDS_WITH_PELLET = 214;
final int TUNNEL_BOUNDS_WITHOUT_PELLET = 215;

final int PELLET = 250;
final int POWER_PELLET = 254;
final int CORRIDOR = 32;

final int PACMAN_TYPE = 166;
final int RED_GHOST_TYPE = 167;
final int PINK_GHOST_TYPE = 168;
final int BLUE_GHOST_TYPE = 169;
final int ORANGE_GHOST_TYPE = 170;

// Default values
// These values will be changed dynamically with map file information
int GHOSTS_HOUSE_EXIT_X = 14;
int GHOSTS_HOUSE_EXIT_Y = 14;

int TOTAL_PELLETS = 0;

// Grid cell positions
int MAZE_INIT_X = 0;
int MAZE_INIT_Y = 0;
int MAZE_END_X = MAX_ROWS - 1;
int MAZE_END_Y = MAX_COLS - 1;
// Window pixel coordinates
int MAZE_MIN_COORD_X = cellToCoord(MAZE_INIT_X);
int MAZE_MIN_COORD_Y = cellToCoord(MAZE_INIT_Y);
int MAZE_MAX_COORD_X = cellToCoord(MAZE_END_X) + SEVEN_PIXELS;
int MAZE_MAX_COORD_Y = cellToCoord(MAZE_END_Y) + SEVEN_PIXELS;

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

final int[] allPelletTypes = new int[] {
  PELLET,
  POWER_PELLET,
  UP_RESTRICTED_POSITION_WITH_PELLET,
  TUNNEL_BOUNDS_WITH_PELLET
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
    creatures = new ArrayList<>();
    ghosts = new ArrayList<>();
  }

  void initializeSpecialVariables() {
    boolean mazeInitGridCoordSet = false;
    TOTAL_PELLETS = 0;
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        if (isAnyKindOfPellet(x, y)) {
          TOTAL_PELLETS++;
        } else if (getTileValue(x, y) == RED_GHOST_TYPE) {
          GHOSTS_HOUSE_EXIT_X = x;
          GHOSTS_HOUSE_EXIT_Y = y;
        } else if (getTileValue(x, y) == DOUBLE_CORNER_TOP_LEFT && !mazeInitGridCoordSet) { // The first occurrence matters
          MAZE_INIT_X = x;
          MAZE_INIT_Y = y;
          mazeInitGridCoordSet = true;
        } else if (getTileValue(x, y) == DOUBLE_CORNER_BOTTOM_RIGHT) { // The last occurrence matters
          MAZE_END_X = x;
          MAZE_END_Y = y;
        }
      }
    }

    MAZE_MIN_COORD_X = cellToCoord(MAZE_INIT_X);
    MAZE_MIN_COORD_Y = cellToCoord(MAZE_INIT_Y);
    MAZE_MAX_COORD_X = cellToCoord(MAZE_END_X) + SEVEN_PIXELS;
    MAZE_MAX_COORD_Y = cellToCoord(MAZE_END_Y) + SEVEN_PIXELS;
  }

  void renderGrid() {
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        drawStage(x, y);
        drawCharacters(x, y);
      }
    }
    refreshCurrentLevel();
  }

  void refreshCurrentLevel() {
    // TODO: Make these coordinates to be relative.
    int x = 10;
    int y = 0;
    tileGrid.cleanSection(x, y, x+1, y+1);
    drawCurrentLevel(x, y);
  }

  void refreshGrid() {
    for(Creature creature : creatures) {
      cleanPreviousPosition(creature);
    }
    if (showTarget) {
      for(Ghost ghost : ghosts) {
        ghost.showTarget();
      }
    }
    for(Creature creature : creatures) {
      creature.drawYourSelf();
    }

    refreshPalletCounter();
  }

  void refreshPalletCounter() {
    // TODO: Make these coordinates to be relative.
    int x = 4;
    int y = 0;
    tileGrid.cleanSection(x, y, x+1, y+1);
    drawPalletCounter(x, y);
  }

  void cleanPreviousPosition(Creature creature) {
    int currentXgrid = creature.getGridCellX();
    int currentYgrid = creature.getGridCellY();
    cleanSection((currentXgrid - 1), (currentYgrid - 1), (currentXgrid + 1), (currentYgrid + 1));
  }

  void cleanPreviousTarget(Ghost ghost) {
    int previousTargetXgrid = ghost.getPreviousTargetX();
    int previousTargetYgrid = ghost.getPreviousTargetY();
    cleanSection((previousTargetXgrid - 1), (previousTargetYgrid - 1), (previousTargetXgrid + 1), (previousTargetYgrid + 1));
  }

  void cleanCell(int x, int y) {
    cleanSection(x, y, x, y);
  }
  
  void cleanSection(int fromX, int fromY, int toX, int toY) {

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
        case UP_RESTRICTED_POSITION_WITHOUT_PELLET:
        case TUNNEL_BOUNDS_WITHOUT_PELLET:
          drawCorridorInCellGrid(x, y);
          break;
        case PELLET:
        case UP_RESTRICTED_POSITION_WITH_PELLET:
        case TUNNEL_BOUNDS_WITH_PELLET:
          drawPelletInCellGrid(x, y);
          break;
        case POWER_PELLET:
          drawPowerPelletInCellGrid(x, y);
          break;
      }
    }
    if (showGrid) {
      drawTile(x, y);
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

  void setUpRestrictedPositionWithoutPellet(Creature creature) {
    setTileValue(creature.getGridCellX(), creature.getGridCellY(), UP_RESTRICTED_POSITION_WITHOUT_PELLET);
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

  boolean isUpRestricted(Creature creature) {
    return isUpRestricted(creature.getGridCellX(), creature.getGridCellY());
  }

  boolean isUpRestrictedPositionWithPellet(Creature creature) {
    return isUpRestrictedPositionWithPellet(creature.getGridCellX(), creature.getGridCellY());
  }

  boolean isAnyKindOfPellet(Creature creature) {
    return isAnyKindOfPellet(creature.getGridCellX(), creature.getGridCellY());
  }

  boolean isTunnelBounds(Creature creature) {
    return isTunnelBounds(creature.getGridCellX(), creature.getGridCellY());
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

  boolean isAnyKindOfPellet(int x, int y) {
    int gridValue = getTileValue(x, y);
    for (int i = 0; i < allPelletTypes.length; i++) {
      if (gridValue == allPelletTypes[i]) {
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

  boolean isUpRestricted(int x, int y) {
    return getTileValue(x, y) == UP_RESTRICTED_POSITION_WITH_PELLET || getTileValue(x, y) == UP_RESTRICTED_POSITION_WITHOUT_PELLET;
  }

  boolean isUpRestrictedPositionWithPellet(int x, int y) {
    return getTileValue(x, y) == UP_RESTRICTED_POSITION_WITH_PELLET;
  }

  boolean isTunnelBounds(int x, int y) {
    return getTileValue(x, y) == TUNNEL_BOUNDS_WITH_PELLET || getTileValue(x, y) == TUNNEL_BOUNDS_WITHOUT_PELLET;
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
    println("MAZE_INIT_X: " + MAZE_INIT_X + "\nMAZE_INIT_Y: " + MAZE_INIT_Y + "\nMAZE_END_X: " + MAZE_END_X + "\nMAZE_END_Y: " + MAZE_END_Y + 
          "\nMAZE_MIN_COORD_X: " + MAZE_MIN_COORD_X + "\nMAZE_MIN_COORD_Y: " + MAZE_MIN_COORD_Y + "\nMAZE_MAX_COORD_X: " + MAZE_MAX_COORD_X + "\nMAZE_MAX_COORD_Y: " + MAZE_MAX_COORD_Y + 
          "\nTOTAL_PELLETS: " + TOTAL_PELLETS + "\nGHOSTS_HOUSE_EXIT_X: " + GHOSTS_HOUSE_EXIT_X + "\nGHOSTS_HOUSE_EXIT_Y: " + GHOSTS_HOUSE_EXIT_Y);
  }

  int getTileValue(int x, int y) {
    int validX = validateCoordinate(x, MAX_COLS);
    int validY = validateCoordinate(y, MAX_ROWS);
    return grid[validY][validX];
  } 

  void setTileValue(int x, int y, int value) {
    grid[y][x] = value;
  }
}
