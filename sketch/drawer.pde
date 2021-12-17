
color wallColor = color(25, 25, 166);//Blue
color eyesColor = color(33, 33, 222);//Blue

void drawCreature(int drawX, int drawY, color c) {
  noStroke();
  fill(c);
  /* drawX, drawY are the center of the circle */
  circle(drawX, drawY, CREATURE_SIZE);
  stroke(0);
}

void drawGhost(int drawX, int drawY, color c) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  line(drawX - ONE_PIXEL, drawY - SEVEN_PIXELS, drawX + TWO_PIXELS, drawY - SEVEN_PIXELS);
  line(drawX - THREE_PIXELS, drawY - SIX_PIXELS, drawX + FOUR_PIXELS, drawY - SIX_PIXELS);
  line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FIVE_PIXELS, drawY - FIVE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + SIX_PIXELS, drawY - FOUR_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + SIX_PIXELS, drawY - THREE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
  line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX + SEVEN_PIXELS, drawY - ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY, drawX + SEVEN_PIXELS, drawY);
  line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX + SEVEN_PIXELS, drawY + ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX + SEVEN_PIXELS, drawY + TWO_PIXELS);
  line(drawX - SIX_PIXELS, drawY + THREE_PIXELS, drawX + SEVEN_PIXELS, drawY + THREE_PIXELS);
  line(drawX - SIX_PIXELS, drawY + FOUR_PIXELS, drawX + SEVEN_PIXELS, drawY + FOUR_PIXELS);
  // ghost fringes
  strokeWeight(PIXEL_SIZE);
  strokeCap(PROJECT); // Point appears square. This is for point() function.

  point(drawX - SIX_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - FIVE_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - THREE_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - TWO_PIXELS, drawY + FIVE_PIXELS);
  point(drawX - ONE_PIXEL, drawY + FIVE_PIXELS);
  point(drawX + TWO_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + THREE_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + SIX_PIXELS, drawY + FIVE_PIXELS);
  point(drawX + SEVEN_PIXELS, drawY + FIVE_PIXELS);

  point(drawX - SIX_PIXELS, drawY + SIX_PIXELS);
  point(drawX - TWO_PIXELS, drawY + SIX_PIXELS);
  point(drawX - ONE_PIXEL, drawY + SIX_PIXELS);
  point(drawX + TWO_PIXELS, drawY + SIX_PIXELS);
  point(drawX + THREE_PIXELS, drawY + SIX_PIXELS);
  point(drawX + SEVEN_PIXELS, drawY + SIX_PIXELS);

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawEyes(int drawX, int drawY, int selectedMovement) {
  strokeWeight(PIXEL_SIZE);
    switch(selectedMovement) {
      case UP:
        break;
      case DOWN:
        break;
      case LEFT:
        // Left eye
        stroke(255);
        line(drawX - FOUR_PIXELS, drawY - FOUR_PIXELS, drawX - THREE_PIXELS, drawY - FOUR_PIXELS);
        line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX - TWO_PIXELS, drawY - THREE_PIXELS);
        line(drawX - FIVE_PIXELS, drawY - TWO_PIXELS, drawX - TWO_PIXELS, drawY - TWO_PIXELS);
        line(drawX - FIVE_PIXELS, drawY - ONE_PIXEL, drawX - TWO_PIXELS, drawY - ONE_PIXEL);
        line(drawX - FOUR_PIXELS, drawY, drawX - THREE_PIXELS, drawY);

        // Left pupil
        stroke(eyesColor);
        line(drawX - FIVE_PIXELS, drawY - TWO_PIXELS, drawX - FOUR_PIXELS, drawY - TWO_PIXELS);
        line(drawX - FIVE_PIXELS, drawY - ONE_PIXEL, drawX - FOUR_PIXELS, drawY - ONE_PIXEL);

        // Right eye
        stroke(255);
        line(drawX + TWO_PIXELS, drawY - FOUR_PIXELS, drawX + THREE_PIXELS, drawY - FOUR_PIXELS);
        line(drawX + ONE_PIXEL, drawY - THREE_PIXELS, drawX + FOUR_PIXELS, drawY - THREE_PIXELS);
        line(drawX + ONE_PIXEL, drawY - TWO_PIXELS, drawX + FOUR_PIXELS, drawY - TWO_PIXELS);
        line(drawX + ONE_PIXEL, drawY - ONE_PIXEL, drawX + FOUR_PIXELS, drawY - ONE_PIXEL);
        line(drawX + TWO_PIXELS, drawY, drawX + THREE_PIXELS, drawY);

        // Right pupil
        stroke(eyesColor);
        line(drawX + ONE_PIXEL, drawY - TWO_PIXELS, drawX + TWO_PIXELS, drawY - TWO_PIXELS);
        line(drawX + ONE_PIXEL, drawY - ONE_PIXEL, drawX + TWO_PIXELS, drawY - ONE_PIXEL);
        break;
      case RIGHT:
        break;
    }

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPacman(int drawX, int drawY, color c) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  line(drawX - TWO_PIXELS, drawY - SIX_PIXELS, drawX + TWO_PIXELS, drawY - SIX_PIXELS);
  line(drawX - FOUR_PIXELS, drawY - FIVE_PIXELS, drawX + FOUR_PIXELS, drawY - FIVE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - FOUR_PIXELS, drawX + FIVE_PIXELS, drawY - FOUR_PIXELS);
  line(drawX - FIVE_PIXELS, drawY - THREE_PIXELS, drawX + FIVE_PIXELS, drawY - THREE_PIXELS);
  line(drawX - SIX_PIXELS, drawY - TWO_PIXELS, drawX + SIX_PIXELS, drawY - TWO_PIXELS);
  line(drawX - SIX_PIXELS, drawY - ONE_PIXEL, drawX + SIX_PIXELS, drawY - ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY, drawX + SIX_PIXELS, drawY);
  line(drawX - SIX_PIXELS, drawY + ONE_PIXEL, drawX + SIX_PIXELS, drawY + ONE_PIXEL);
  line(drawX - SIX_PIXELS, drawY + TWO_PIXELS, drawX + SIX_PIXELS, drawY + TWO_PIXELS);
  line(drawX - FIVE_PIXELS, drawY + THREE_PIXELS, drawX + FIVE_PIXELS, drawY + THREE_PIXELS);
  line(drawX - FIVE_PIXELS, drawY + FOUR_PIXELS, drawX + FIVE_PIXELS, drawY + FOUR_PIXELS);
  line(drawX - FOUR_PIXELS, drawY + FIVE_PIXELS, drawX + FOUR_PIXELS, drawY + FIVE_PIXELS);
  line(drawX - TWO_PIXELS, drawY + SIX_PIXELS, drawX + TWO_PIXELS, drawY + SIX_PIXELS);

  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawCreatureCenter(int drawX, int drawY, color c) {
  fill(c);
  circle(drawX, drawY, CREATURE_CENTER_SIZE);
}

// It draws a square starting from left-up corner
void drawWallCell(int drawX, int drawY) {
  stroke(255);
  drawSquare(drawX, drawY);
}

// Pixel coordinates
void drawBlackCell(int drawX, int drawY) {
  stroke(0);
  drawSquare(drawX, drawY);
}

// Grid positions
void drawCorridorInCellGrid(int x, int y) {
  stroke(0);
  drawSquare(cellToCoord(x), cellToCoord(y));
}

void drawInvisibleWallInCellGrid(int x, int y) {
  stroke(0);
  drawSquare(cellToCoord(x), cellToCoord(y));
}

/* cuantizeCoord(...) forces to any coordinate to start from left-up corner of a cell inside the grid */
void drawSquare(int drawX, int drawY) {
  /* drawX, drawY are the left-up corner of the square */
  strokeWeight(PIXEL_SIZE);
  strokeCap(PROJECT); // Point appears square.
  for (int pixelY = 0; pixelY < 8; pixelY++) {
    for (int pixelX = 0; pixelX < 8; pixelX++) {
       point(drawX + (PIXEL_SIZE * pixelX), drawY + (PIXEL_SIZE * pixelY));
    }
  }
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  stroke(255);
  strokeWeight(PIXEL_SIZE);
  strokeCap(PROJECT); // Point appears square.
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + THREE_PIXELS);
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FOUR_PIXELS);
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + THREE_PIXELS);
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FOUR_PIXELS);
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPowerPelletInCellGrid(int x, int y) {
  drawCorridorInCellGrid(x, y);
  stroke(255);
  strokeWeight(PIXEL_SIZE);
  line(cellToCoord(x) + TWO_PIXELS, cellToCoord(y), cellToCoord(x) + FIVE_PIXELS, cellToCoord(y));
  line(cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + ONE_PIXEL, cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + ONE_PIXEL);
  line(cellToCoord(x), cellToCoord(y) + TWO_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + TWO_PIXELS);
  line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + THREE_PIXELS);
  line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FOUR_PIXELS);
  line(cellToCoord(x), cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + FIVE_PIXELS);
  line(cellToCoord(x) + ONE_PIXEL, cellToCoord(y) + SIX_PIXELS, cellToCoord(x) + SIX_PIXELS, cellToCoord(y) + SIX_PIXELS);
  line(cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + SEVEN_PIXELS);
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawTarget(int x, int y, color c) {
  stroke(c);
  strokeWeight(PIXEL_SIZE);
  line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y));
  line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS);
  line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS);
  line(cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + SEVEN_PIXELS);
  // back to default
  strokeWeight(1);
  stroke(0);
}

void drawPalletCounter() {
  int x = 4;
  int y = 0;
  tileGrid.cleanSection(x, x+1, y, y+1);
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
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 4 "pixels" (base + THREE_PIXELS) from left cell side
      break;
    case DOUBLE_WALL_VERTICAL_RIGHT:
      // Outside line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + CELL_SIZE);; // Vertical line over the right cell side
      // Inside line
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 5 "pixels" from right cell side
      break;
    case DOUBLE_WALL_HORIZONTAL_TOP:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + CELL_SIZE, cellToCoord(y)); // Horizontal line over the top cell side
      // Inside line
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Horizontal line to 4 "pixels" from top cell side
      break;
    case DOUBLE_WALL_HORIZONTAL_BOTTOM:
      // Outside line
      line(cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + SEVEN_PIXELS); // Horizontal line over the bottom cell side
      // Inside line
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + FOUR_PIXELS); // Horizontal line to 5 "pixels" from top cell side
      break;
    case DOUBLE_CORNER_TOP_LEFT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + CELL_SIZE, cellToCoord(y)); // Horizontal line over the top cell side
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + CELL_SIZE); // Vertical line over the left side
      // Inside corner
      doubleCornerTopLeft(x, y);
      break;
    case DOUBLE_CORNER_TOP_RIGHT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + CELL_SIZE, cellToCoord(y)); // Horizontal line over the top cell side
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + CELL_SIZE);; // Vertical line over the right cell side
      // Inside corner
      doubleCornerTopRight(x, y);
      break;
    case DOUBLE_CORNER_BOTTOM_LEFT:
      // Outside line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + CELL_SIZE); // Vertical line over the left side
      line(cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + SEVEN_PIXELS); // Horizontal line over the bottom cell side
      // Inside corner
      doubleCornerBottomLeft(x, y);
      break;
    case DOUBLE_CORNER_BOTTOM_RIGHT:
      // Outside line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + CELL_SIZE);; // Vertical line over the right cell side
      line(cellToCoord(x), cellToCoord(y) + SEVEN_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + SEVEN_PIXELS); // Horizontal line over the bottom cell side
      // Inside corner
       doubleCornerBottomRight(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_LEFT:
      // Outside horizontal top line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + CELL_SIZE, cellToCoord(y)); // Horizontal line over the top cell side
      // Inside corner
      doubleCornerTopLeft(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_HORIZONTAL_TOP_RIGHT:
      // Outside horizontal top line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x) + CELL_SIZE, cellToCoord(y)); // Horizontal line over the top cell side
      // Inside corner
      doubleCornerTopRight(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_BOTTOM_LEFT:
      // Outside vertical left line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + CELL_SIZE); // Vertical line over the left side
      // Inside corner
      doubleCornerBottomLeft(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_LEFT_TOP_LEFT:
      // Outside vertical left line
      line(cellToCoord(x), cellToCoord(y), cellToCoord(x), cellToCoord(y) + CELL_SIZE); // Vertical line over the left side
      // Inside corner
      doubleCornerTopLeft(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_BOTTOM_RIGHT:
      // Outside vertical right line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + CELL_SIZE);; // Vertical line over the right cell side
      // Inside corner
      doubleCornerBottomRight(x, y);
      break;
    case DOUBLE_MIDDLE_CORNER_VERTICAL_RIGHT_TOP_RIGHT:
      // Outside vertical right line
      line(cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y), cellToCoord(x) + SEVEN_PIXELS, cellToCoord(y) + CELL_SIZE);; // Vertical line over the right cell side
      // Inside corner
      doubleCornerTopRight(x, y);
      break;
    case SIMPLE_WALL_VERTICAL_LEFT:
      line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 4 "pixels" from left cell side
      break;
    case SIMPLE_WALL_VERTICAL_RIGHT:
      line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line to 5 "pixels" from right cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_TOP:
      line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Horizontal line to 4 "pixels" from top cell side
      break;
    case SIMPLE_WALL_HORIZONTAL_BOTTOM:
      line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + FOUR_PIXELS); // Horizontal line to 5 "pixels" from top cell side
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
      doubleCornerTopLeft(x, y);
      break;
    case SIMPLE_CONVEX_CORNER_TOP_RIGHT:
      doubleCornerTopRight(x, y);
      break;
    case SIMPLE_CONVEX_CORNER_BOTTOM_LEFT:
      doubleCornerBottomLeft(x, y);
      break;
    case SIMPLE_CONVEX_CORNER_BOTTOM_RIGHT:
      doubleCornerBottomRight(x, y);
      break;
  }
  // back to default
  strokeWeight(1);
  stroke(0);
}

void doubleCornerBottomLeft(int x, int y) {
  line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y), cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
  line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
}

void doubleCornerTopLeft(int x, int y) {
  line(cellToCoord(x) + FIVE_PIXELS, cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + CELL_SIZE, cellToCoord(y) + THREE_PIXELS); // Horizontal line
  point(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
  line(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
}

void doubleCornerBottomRight(int x, int y) {
  line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y), cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + TWO_PIXELS); // Vertical line
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + THREE_PIXELS); // Point between lines
  line(cellToCoord(x), cellToCoord(y) + FOUR_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Horizontal line
}

void doubleCornerTopRight(int x, int y) {
  line(cellToCoord(x), cellToCoord(y) + THREE_PIXELS, cellToCoord(x) + TWO_PIXELS, cellToCoord(y) + THREE_PIXELS); // Horizontal line
  point(cellToCoord(x) + THREE_PIXELS, cellToCoord(y) + FOUR_PIXELS); // Point between lines
  line(cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + FIVE_PIXELS, cellToCoord(x) + FOUR_PIXELS, cellToCoord(y) + CELL_SIZE); // Vertical line
}


void drawTestCellInCellGrid(int x, int y) {
  for (int pixelY = 0; pixelY < 8; pixelY++) {
    for (int pixelX = 0; pixelX < 8; pixelX++) {
       stroke(color(random(200), random(200), random(200)));
       point(cellToCoord(x) + (PIXEL_SIZE * pixelX), cellToCoord(y) + (PIXEL_SIZE * pixelY));
    }
  }
  // back to wall color
  stroke(wallColor);
}
