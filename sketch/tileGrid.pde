final int MAX_COLS = 28;
final int MAX_ROWS = 36;

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
        drawWallCellGridToWindow(x, y);
      }
    }
  }

  void refreshGrid() {
    
    cleanPreviousPosition(pacman);
    
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
        drawBlackWallCell(cellToCoord(x), cellToCoord(y));
      }
    }
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
