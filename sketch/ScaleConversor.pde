final int PIXEL_SIZE = 3;
final int CELL_SIZE = PIXEL_SIZE * 8; // Simulates 8 pixels per cell
final int PELLET_SIZE = PIXEL_SIZE * 2;
final int POWER_PELLET_SIZE = CELL_SIZE;

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
  return cellToCoord(cell) + CELL_SIZE / 2;
}
