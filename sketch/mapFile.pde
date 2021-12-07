
final int ASCII_0 = 48;

class MapFile { 
  String[] lines;
  
  MapFile () {  
    lines = loadStrings("map_1.txt");
  }
  
  TileGrid fillGrid() {
    TileGrid tileGrid = new TileGrid();
    String[] lines = getLines();
    for (int y = 0 ; y < lines.length && y < MAX_ROWS; y++) {
      for (int x = 0 ; x < lines[y].length() && x < MAX_COLS; x++) {
        tileGrid.setTileValue(x, y, asciiToNumber(x, y));
      }
    }
    return tileGrid;
  }
  
  void debug() {
    println("File content:");
    println("there are " + lines.length + " lines");
    for (int y = 0 ; y < lines.length && y < MAX_ROWS; y++) {
      for (int x = 0 ; x < lines[y].length() && x < MAX_COLS; x++) {
        print(lines[y].charAt(x));
      }
      println("");
    }
  }
  
  int asciiToNumber(int x, int y) {
    return getCharacter(x, y) - ASCII_0;
  }
  
  char getCharacter(int x, int y) {
    return getLines()[y].charAt(x);
  }

  String[] getLines() {
    return lines;
  }
} 
