
void drawCreature(int drawX, int drawY, color c) {
  fill(c);
  /* drawX, drawY are the center of the circle */
  circle(drawX, drawY, CREATURE_SIZE);
}

void drawCreatureCenter(int drawX, int drawY) {
  fill(color(0, 204, 255));
  circle(drawX, drawY, CREATURE_CENTER_SIZE);
}

/* Square drawing starts from left-up corner */
void drawWhiteWallCell(int drawX, int drawY) {
  fill(255);
  drawSquare(drawX, drawY);
}

void drawBlackWallCell(int drawX, int drawY) {
  fill(0);
  drawSquare(drawX, drawY);
}

/* cuantizeCoord(...) forces to any coordinate to start from left-up corner of a cell inside the grid */
void drawSquare(int drawX, int drawY) {
  /* drawX, drawY are the left-up corner of the square */
  square(cuantizeCoord(drawX), cuantizeCoord(drawY), SCALE);
}

void drawWallCellGridToWindow(int x, int y) {
  fill(255);
  /* drawX, drawY are the left-up corner of the square */
  square(cellToCoord(x), cellToCoord(y), SCALE);
}
