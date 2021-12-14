
color wallColor = color(33, 33, 222);//Blue
final int ONE_PIXEL = (PIXEL_SIZE * 1);
final int TWO_PIXELS = (PIXEL_SIZE * 2);
final int THREE_PIXELS = (PIXEL_SIZE * 3);
final int FOUR_PIXELS = (PIXEL_SIZE * 4);
final int FIVE_PIXELS = (PIXEL_SIZE * 5);
final int SIX_PIXELS = (PIXEL_SIZE * 6);

void drawCreature(int drawX, int drawY, color c) {
  noStroke();
  fill(c);
  /* drawX, drawY are the center of the circle */
  circle(drawX, drawY, CREATURE_SIZE);
  stroke(0);
}

void drawCreatureCenter(int drawX, int drawY, color c) {
  fill(c);
  circle(drawX, drawY, CREATURE_CENTER_SIZE);
}

/* Square drawing starts from left-up corner */
void drawWallCell(int drawX, int drawY) {
  fill(255);
  drawSquare(drawX, drawY);
}

void drawBlackCell(int drawX, int drawY) {
  fill(0);
  drawSquare(drawX, drawY);
}

/* cuantizeCoord(...) forces to any coordinate to start from left-up corner of a cell inside the grid */
void drawSquare(int drawX, int drawY) {
  /* drawX, drawY are the left-up corner of the square */
  square(cuantizeCoord(drawX), cuantizeCoord(drawY), CELL_SIZE);
}


/* These methods are used when we are working with grid positions */

void drawCorridorInCellGrid(int x, int y) {
  fill(0);
  drawSquare(cellToCoord(x), cellToCoord(y));
}

void drawPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  fill(255);
  circle(cellToCoord(x) + (CELL_SIZE / 2), cellToCoord(y) + (CELL_SIZE / 2), PELLET_SIZE);
}

void drawPowerPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  fill(255);
  circle(cellToCoord(x) + (CELL_SIZE / 2), cellToCoord(y) + (CELL_SIZE / 2), POWER_PELLET_SIZE);
}

void drawTarget(int x, int y, color c) {
  stroke(c);
  noFill();
  square(cellToCoord(x), cellToCoord(y), CELL_SIZE);
  stroke(0);
}

void drawPalletCounter() {
  int x = 4;
  int y = 0;
  tileGrid.cleanSection(x, x+1, y, y);
  textFont(f,16);
  fill(255);
  text(nf(pelletCounter, 3), cellToCoord(x), cellToCoord(y+1));
}

/* Walls */

void drawBlueWallInCellGrid(int x, int y, int wallId) {
  drawCorridorInCellGrid(x, y);
  stroke(wallColor);
  strokeWeight(PIXEL_SIZE);
  strokeCap(PROJECT); // Point appears square. This is for point() function.
  switch(wallId) {
    case TEST_CELL:
      drawTestCellInCellGrid(x, y);
      break;
    case DOUBLE_WALL_VERTICAL_LEFT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + CELL_SIZE); // Vertical line over the left side
      // Inside line
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 3 "pixels" from left cell side
      break;
    case DOUBLE_WALL_VERTICAL_RIGHT:
      // Outside line
      line(cellToCoord(x) + CELL_SIZE - PIXEL_SIZE, cellToCoord(y), cellToCoord(x) + CELL_SIZE - PIXEL_SIZE, cellToCoord(y) + CELL_SIZE);; // Vertical line over the right cell side
      // Inside line
      line(cellToCoord(x) + CELL_SIZE - FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + CELL_SIZE - FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 4 "pixels" from right cell side
      break;
    case DOUBLE_WALL_HORIZONTAL_TOP:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + CELL_SIZE, cellToCoord(y)); // Horizontal line over the top cell side
      // Inside line
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x)  + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Horizontal line to 3 "pixels" from top cell side
      break;
    case DOUBLE_CORNER_TOP_LEFT:
      // Outside line
      // TODO Add outside line
      // Inside line
      line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Horizontal line
      point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
      break;
    case DOUBLE_CORNER_TOP_RIGHT:
      // Outside line
      // TODO Add outside line
      // Inside line
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + THREE_PIXELS); // Horizontal line
      point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
      break;
    case DOUBLE_CORNER_BOTTOM_LEFT:
      // Outside line
      // TODO Add outside line
      // Inside line
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
      point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
      line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      break;
    case DOUBLE_CORNER_BOTTOM_RIGHT:
      // Outside line
      // TODO Add outside line
      // Inside line
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
      point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      break;
    case DOUBLE_WALL_HORIZONTAL_BOTTOM:
      // Outside line
      line(cellToCoord(x), cellToCoord(y) + CELL_SIZE - PIXEL_SIZE, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + CELL_SIZE - PIXEL_SIZE); // Horizontal line over the top cell side
      // Inside line
      line(cellToCoord(x), cellToCoord(y) + CELL_SIZE - FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + CELL_SIZE - FOUR_PIXELS); // Horizontal line to 4 "pixels" from top cell side
      break;

// TODO Add missing double walls

    case SIMPLE_WALL_VERTICAL_LEFT:
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 4 "pixels" from left cell side
      break;
    case SIMPLE_WALL_VERTICAL_RIGHT:
      line(cellToCoord(x) + CELL_SIZE - FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + CELL_SIZE - FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 4 "pixels" from right cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_TOP:
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x)  + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Horizontal line to 4 "pixels" from top cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_BOTTOM:
      line(cellToCoord(x), cellToCoord(y) + CELL_SIZE - FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + CELL_SIZE - FOUR_PIXELS); // Horizontal line to 4 "pixels" from top cell side
      break;
    case SIMPLE_CORNER_TOP_LEFT:
      line(cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      point(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + FIVE_PIXELS); // Point between lines
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + SIX_PIXELS, cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
      break;
    case SIMPLE_CORNER_TOP_RIGHT:
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      point(cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + FIVE_PIXELS); // Point between lines
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + SIX_PIXELS, cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
      break;
    case SIMPLE_CORNER_BOTTOM_LEFT:
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + ONE_PIXEL); // Horizontal line
      point(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + TWO_PIXELS); // Point between lines
      line(cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Vertical line
      break;
    case SIMPLE_CORNER_BOTTOM_RIGHT:
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + ONE_PIXEL); // Horizontal line
      point(cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + TWO_PIXELS); // Point between lines
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + THREE_PIXELS); // Vertical line
      break;
    case SIMPLE_CONVEX_CORNER_TOP_LEFT:
      line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Horizontal line
      point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
      break;
    case SIMPLE_CONVEX_CORNER_TOP_RIGHT:
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + THREE_PIXELS); // Horizontal line
      point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
      break;
    case SIMPLE_CONVEX_CORNER_BOTTOM_LEFT:
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
      point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
      line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      break;
    case SIMPLE_CONVEX_CORNER_BOTTOM_RIGHT:
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
      point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
      break;
  }

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawTestCellInCellGrid(int x, int y) {
  for (int pixelY = 0; pixelY < 8; pixelY++) {
    for (int pixelX = 0; pixelX < 8; pixelX++) {
       stroke(color(pixelX + random(200), pixelY + random(200), pixelX + random(200)));
       point(cellToCoord(x) + (PIXEL_SIZE * pixelX), cellToCoord(y) + (PIXEL_SIZE * pixelY));
    }
  }
  // back to wall color
  stroke(wallColor);
}
