
class Tile {
  Player owner;
  boolean winTile;
  PVector pos;

  Tile(float x, float y) {
    pos = new PVector(x, y);
  }

  void check(float mX,float mY,float x, float y) {    
    if (mX>x && mX<x+map.tileSize && mY>y && mY<y+map.tileSize && owner==null) {
      owner = game.onTurn;
      map.freeTiles--;
      game.turn();
    }
  }

  void show() {
    strokeWeight(7);
    stroke(0); 
    noFill();
    // color in if part of winning line
    //if(winTile)fill(owner.col);
    rect(pos.x, pos.y, map.tileSize, map.tileSize);
    // draw X or O
    if(owner!=null)owner.drawShape(pos.x,pos.y);
    fill(0); textSize(12);
    //text(""+winTile,pos.x,pos.y+20);
  }
}