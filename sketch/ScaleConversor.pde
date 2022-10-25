// In pixels
int ORIGINAL_WIDTH  = 224;
int ORIGINAL_HEIGHT = 288;

// Grid cells
final int MAX_COLS = 28;
final int MAX_ROWS = 36;

int INITIAL_RELATIVE_COORD_X;
int INITIAL_RELATIVE_COORD_Y;
int GAME_WIDTH;
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
  if (height < ORIGINAL_HEIGHT) {
    println("ERROR: height " + height + " is lower than " + ORIGINAL_HEIGHT + ". Aborting...");
    exit();
  } else if (height >= ORIGINAL_HEIGHT     && height < ORIGINAL_HEIGHT * 2) {
    GAME_HEIGHT = ORIGINAL_HEIGHT; // PIXEL_SIZE = 1
    GAME_WIDTH  = ORIGINAL_WIDTH;
  } else if (height >= ORIGINAL_HEIGHT * 2 && height < ORIGINAL_HEIGHT * 3) {
    GAME_HEIGHT = ORIGINAL_HEIGHT * 2; // PIXEL_SIZE = 2
    GAME_WIDTH  = ORIGINAL_WIDTH  * 2;
  } else if (height >= ORIGINAL_HEIGHT * 3 && height < ORIGINAL_HEIGHT * 4) {
    GAME_HEIGHT = ORIGINAL_HEIGHT * 3; // PIXEL_SIZE = 3
    GAME_WIDTH  = ORIGINAL_WIDTH  * 3;
  } else if (height >= ORIGINAL_HEIGHT * 4 && height < ORIGINAL_HEIGHT * 5) {
    GAME_HEIGHT = ORIGINAL_HEIGHT * 4; // PIXEL_SIZE = 4
    GAME_WIDTH  = ORIGINAL_WIDTH  * 4;
  } else if (height >= ORIGINAL_HEIGHT * 5 && height < ORIGINAL_HEIGHT * 6) {
    GAME_HEIGHT = ORIGINAL_HEIGHT * 5; // PIXEL_SIZE = 5
    GAME_WIDTH  = ORIGINAL_WIDTH  * 5;
  } else if (height >= ORIGINAL_HEIGHT * 6) {
    GAME_HEIGHT = ORIGINAL_HEIGHT * 6; // PIXEL_SIZE = 6
    GAME_WIDTH  = ORIGINAL_WIDTH  * 6;
  }

  INITIAL_RELATIVE_COORD_X = (width / 2) - (GAME_WIDTH / 2);
  INITIAL_RELATIVE_COORD_Y = (height / 2) - (GAME_HEIGHT / 2);

  CELL_SIZE = GAME_HEIGHT / MAX_ROWS;
  PIXEL_SIZE = CELL_SIZE / 8; // Emulates 8 pixels per cell
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
// TODO: split in cellToCoordX(INITIAL_RELATIVE_COORD_X) and cellToCoordY(INITIAL_RELATIVE_COORD_Y)
int cellToCoord(int cells) {
  return INITIAL_RELATIVE_COORD_Y + cells * CELL_SIZE;
}

/* Convert a window coodinate to a cell position inside the grid */
// TODO: split in coordToCellX(INITIAL_RELATIVE_COORD_X) and coordToCellY(INITIAL_RELATIVE_COORD_Y)
int coordToCell(int coord) {
  if (CELL_SIZE == 0) {
    return 0;
  }
  return (coord - INITIAL_RELATIVE_COORD_Y) / CELL_SIZE;
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
  println("height: " + height + "\nwidth: " + width + "\nGAME_HEIGHT: " + GAME_HEIGHT + "\nCELL_SIZE: " + CELL_SIZE + "\nPIXEL_SIZE: " + PIXEL_SIZE + "\nINITIAL_RELATIVE_COORD_X: " + INITIAL_RELATIVE_COORD_X + "\nINITIAL_RELATIVE_COORD_Y: " + INITIAL_RELATIVE_COORD_Y + "\nCREATURE_CENTER_SIZE: " + CREATURE_CENTER_SIZE);
}
