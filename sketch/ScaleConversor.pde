final int MAX_COLS = 28;
final int MAX_ROWS = 36;

int GAME_HEIGHT;
int CELL_SIZE;
int PIXEL_SIZE;
int PELLET_SIZE;
int ONE_PIXEL;
int TWO_PIXELS;
int THREE_PIXELS;
int FOUR_PIXELS;
int FIVE_PIXELS;
int SIX_PIXELS;
int SEVEN_PIXELS;
int CREATURE_CENTER_SIZE;

void initializeScaleVariables() {
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  if (height < 288) {
    println("ERROR: height " + height + " is lower than 288. Aborting...");
    exit();
  } else if (height >= 288 && height < 576) {
    GAME_HEIGHT = 288; // PIXEL_SIZE = 1
  } else if (height >= 576 && height < 864) {
    GAME_HEIGHT = 576; // PIXEL_SIZE = 2
  } else if (height >= 864 && height < 1152) {
    GAME_HEIGHT = 864; // PIXEL_SIZE = 3
  } else if (height >= 1152 && height < 1440) {
    GAME_HEIGHT = 1152; // PIXEL_SIZE = 4
  } else if (height >= 1440) {
    GAME_HEIGHT = 1440; // PIXEL_SIZE = 5
  }

  CELL_SIZE = GAME_HEIGHT / MAX_ROWS;
  PIXEL_SIZE = CELL_SIZE / 8; // Simulates 8 pixels per cell
  PELLET_SIZE = PIXEL_SIZE * 2;
  ONE_PIXEL = (PIXEL_SIZE * 1);
  TWO_PIXELS = (PIXEL_SIZE * 2);
  THREE_PIXELS = (PIXEL_SIZE * 3);
  FOUR_PIXELS = (PIXEL_SIZE * 4);
  FIVE_PIXELS = (PIXEL_SIZE * 5);
  SIX_PIXELS = (PIXEL_SIZE * 6);
  SEVEN_PIXELS = (PIXEL_SIZE * 7);
  CREATURE_CENTER_SIZE = TWO_PIXELS;
}

/* Convert a position cell from the grid to a window coodinate */
int cellToCoord(int cells) {
  return cells * CELL_SIZE;
}

/* Convert a window coodinate to a cell position inside the grid */
int coordToCell(int coord) {
  if (CELL_SIZE == 0) {
    return 0;
  }
  return coord / CELL_SIZE;
}

/* Forces any coordinate to start from left-up corner of a cell inside the grid */
int cuantizeCoord(int coord) {
  return cellToCoord(coordToCell(coord));
}

/* Converts a cell position into a pixel coordinate in the center of asociated cell */
int convertToCoordInCellCenter(int cell) {
  return cellToCoord(cell) + (CELL_SIZE / 2);
}

void printScaleVariables() {
  println("height: " + height + "\nwidth: " + width + "\nGAME_HEIGHT: " + GAME_HEIGHT + "\nCELL_SIZE: " + CELL_SIZE + "\nPIXEL_SIZE: " + PIXEL_SIZE + "\nCREATURE_CENTER_SIZE: " + CREATURE_CENTER_SIZE);
}
