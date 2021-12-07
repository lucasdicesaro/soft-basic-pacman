final int MAX_COLS = 28;
final int MAX_ROWS = 36;

final int WALL = 0;
final int PELLET = 1;
final int POWER_PELLET = 7;
final int CORRIDOR = 8;

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
        switch (getTileValue(x, y)) {
          case WALL:
            drawWallInCellGrid(x, y);
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
          case PACMAN_TYPE:
            pacman = new Pacman(cellToCoord(x) + SCALE / 2, cellToCoord(y) + SCALE / 2);
            break;
          // TODO: Add the ghosts
        }
      }
    }
  }

  void refreshGrid() {
    cleanPreviousPosition(pacman);
    
    // TODO: Add the ghosts.
    pacman.drawYourSelf();
  }
  
  
  void cleanPreviousPosition(Creature creature) {
    int currentXgrid = coordToCell(creature.getDrawX());
    int currentYgrid = coordToCell(creature.getDrawY());
    
     switch(creature.getSelectedMovement()) {
      case UP:
        cleanDown(currentXgrid, currentYgrid, creature.getCreatureRadiusCells());
        break;
      case DOWN:
        cleanUp(currentXgrid, currentYgrid, creature.getCreatureRadiusCells());
        break;
      case LEFT:
        cleanRight(currentXgrid, currentYgrid, creature.getCreatureRadiusCells());
        break;
      case RIGHT:
        cleanLeft(currentXgrid, currentYgrid, creature.getCreatureRadiusCells());
        break;
    }
  }
  
  void cleanDown(int currentXgrid, int currentYgrid, int creatureRadiusCells) {
    cleanSection((currentXgrid - creatureRadiusCells), (currentXgrid + creatureRadiusCells), currentYgrid, (currentYgrid + creatureRadiusCells));
  }

  void cleanUp(int currentXgrid, int currentYgrid, int creatureRadiusCells) {
    cleanSection((currentXgrid - creatureRadiusCells), (currentXgrid + creatureRadiusCells), (currentYgrid - creatureRadiusCells), currentYgrid);
  }
  
  void cleanRight(int currentXgrid, int currentYgrid, int creatureRadiusCells) {
    cleanSection(currentXgrid, (currentXgrid + creatureRadiusCells), (currentYgrid - creatureRadiusCells), (currentYgrid + creatureRadiusCells));
  }

  void cleanLeft(int currentXgrid, int currentYgrid, int creatureRadiusCells) {    
    cleanSection((currentXgrid - creatureRadiusCells), currentXgrid, (currentYgrid - creatureRadiusCells), (currentYgrid + creatureRadiusCells));
  }
  
  void cleanSection(int fromX, int toX, int fromY, int toY) {
    for(int x = fromX; x <= toX; x++) {
      for(int y = fromY; y <= toY; y++) {
        switch (getTileValue(x, y)) {
          case WALL:
            drawWallInCellGrid(x, y);
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
          case PACMAN_TYPE:
            drawCorridorInCellGrid(x, y);
            break;
          // TODO: Add the ghosts
          case 3: // 3 red
            drawCorridorInCellGrid(x, y);
            break;
        }
      }
    }
  }
  
  // Movement is only validated when creature is in the center of the cell.
  boolean isNotWallOnCreatureLeft(Creature creature) {
    return !isCenterOfTheCell(creature.getDrawX()) || !isWall(coordToCell(creature.getDrawX())-1, coordToCell(creature.getDrawY()));
  }

  boolean isNotWallOnCreatureRight(Creature creature) {
    return !isCenterOfTheCell(creature.getDrawX()) || !isWall(coordToCell(creature.getDrawX())+1, coordToCell(creature.getDrawY()));
  }

  boolean isNotWallOnCreatureUp(Creature creature) {
    return !isCenterOfTheCell(creature.getDrawY()) || !isWall(coordToCell(creature.getDrawX()), coordToCell(creature.getDrawY())-1);
  }

  boolean isNotWallOnCreatureDown(Creature creature) {
    return !isCenterOfTheCell(creature.getDrawY()) || !isWall(coordToCell(creature.getDrawX()), coordToCell(creature.getDrawY())+1);
  }

  boolean isWall(int x, int y) {
    return getTileValue(x, y) == WALL;
  }

  // Checks if coord is the center of the cell
  boolean isCenterOfTheCell(int coord) {
    return coord == cuantizeCoord(coord) + (SCALE / 2);
  }

  void cleanTile(int x, int y) {
    setTileValue(x, y, 0);
  }

  void debug() {
    println("Grid content:");
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        print(getTileValue(x, y));
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
