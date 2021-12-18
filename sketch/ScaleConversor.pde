final int MAX_COLS = 28;
final int MAX_ROWS = 36;

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
float CREATURE_CENTER_SCALE = 0.5;

void initializeScaleVariables() {
  CELL_SIZE = height / 36;
  PIXEL_SIZE = CELL_SIZE / 8; // Simulates 8 pixels per cell
  PELLET_SIZE = PIXEL_SIZE * 2;
  ONE_PIXEL = (PIXEL_SIZE * 1);
  TWO_PIXELS = (PIXEL_SIZE * 2);
  THREE_PIXELS = (PIXEL_SIZE * 3);
  FOUR_PIXELS = (PIXEL_SIZE * 4);
  FIVE_PIXELS = (PIXEL_SIZE * 5);
  SIX_PIXELS = (PIXEL_SIZE * 6);
  SEVEN_PIXELS = (PIXEL_SIZE * 7);
  CREATURE_CENTER_SIZE = (int) (CELL_SIZE * CREATURE_CENTER_SCALE);
}

/* Convert a position cell from the grid to a window coodinate */
int cellToCoord(int cells) {
  return cells * CELL_SIZE;
}

/* Convert a window coodinate to a cell position inside the grid */
int coordToCell(int coord) {
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
