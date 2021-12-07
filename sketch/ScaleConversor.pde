final int SCALE = 24;

/* Convert a position cell from the grid to a window coodinate */
int cellToCoord(int cells) {
  return cells * SCALE;
}

/* Convert a window coodinate to a cell position inside the grid */
int coordToCell(int coord) {
  return coord / SCALE;
}

/* Forces any coordinate to start from left-up corner of a cell inside the grid */
int cuantizeCoord(int coord) {
  return cellToCoord(coordToCell(coord));
}
