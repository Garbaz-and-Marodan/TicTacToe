
class Map {
  Tile[][] field;
  float tileSize;
  int freeTiles;

  Map() {
    tileSize = canvas.size/3;
    field = new Tile[3][3];
    for (int x=0; x<field.length; x++) {
      for (int y=0; y<field[0].length; y++) {
        field[x][y] = new Tile(x*canvas.size/3, y*canvas.size/3);
      }
    }
    freeTiles = field.length*field[0].length;
  }

  void refresh() {
    freeTiles = field.length*field[0].length;
    for (int x=0; x<field.length; x++) {
      for (int y=0; y<field[0].length; y++) {
        field[x][y].owner = null;
      }
    }
  }

  void show() {
    for (int x=0; x<field.length; x++) {
      for (int y=0; y<field[0].length; y++) {
        field[x][y].show();
      }
    }
  }

  Player checkWinner() {
    Player winner = null;
    winner = checkHori(winner);
    winner = checkVerti(winner);
    winner = checkDiag(winner);
    return winner;
  }

  // "brute force checking"
  Player checkHori(Player winner) {
    if (winner==null) {
      for (int y=0; y<field[0].length; y++) { // iterate through all rows
        for (int x=0; x<field.length; x++) { // each row
          Player owner = field[x][y].owner;
          if ((owner!=null && x==0) || (owner!=null && x!=0 && owner==winner)) winner = owner;
          else winner = null;
        }
        if (winner != null) break;
      }
    }
    return winner;
  }
  Player checkVerti(Player winner) {
    if (winner==null) {
      for (int x=0; x<field.length; x++) { // iterate through all columns
        for (int y=0; y<field[0].length; y++) { // each column
          Player owner = field[x][y].owner;
          if ((owner!=null && y==0) || (owner!=null && y!=0 && owner==winner)) winner = owner;
          else winner = null;
        }
        if (winner != null) break;
      }
    }
    return winner;
  }
  Player checkDiag(Player winner) {
    if (winner==null) {
      // top-left to bottom-right
      for (int d=0; d<field[0].length; d++) {  // iterate through diagonals
        for (int x=0; x<field.length; x++) { 
          int y = x+d;
          if(y>=field[0].length)y-=field[0].length;
          Player owner = field[x][y].owner;
          if ((owner!=null && x==0) || (owner!=null && x!=0 && owner==winner)) winner = owner;
          else winner = null;
        }
        if(winner!=null)break;
      }
    }
    if (winner==null) {
      // bottom-left to top-right
      for (int d=0; d<field[0].length; d++) {  // iterate through diagonals
        for (int x=0; x<field.length; x++) { 
          int y = -x+d;
          if(y<0)y+=field[0].length;
          Player owner = field[x][y].owner;
          if ((owner!=null && x==0) || (owner!=null && x!=0 && owner==winner)) winner = owner;
          else winner = null;
        }
        if(winner!=null)break;
      }
    }
    return winner;
  }

  /* // Recursive attempt
   Player checkHori(int x, int y, Player winner){
   // Tile not owned && no winner yet --> go to next row
   if(field[x][y].owner == null && winner == null && y<field[0].length-1) winner = checkHori(0,1+y,null);
   // Tile not owned && already a winner --> winner is not actually the winner
   if(field[x][y].owner == null && winner != null) return null;
   //// Tile owned --> go to next column
   if(field[x][y].owner != null && x<field.length-1) winner = checkHori(1+x,y,field[x][y].owner); 
   // still no winner --> go to next row
   if(winner == null && y<field[0].length-1) winner = checkHori(0,1+y,null);
   return winner;
   }
   */
}