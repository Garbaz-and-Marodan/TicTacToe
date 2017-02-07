
class Player {
  color col;
  int shape;
  String name;
  
  Player(String name, color col, int shape) {
    this.name = name;
    this.col = col;
    this.shape = shape;
  }

  void drawShape(float x, float y){
    strokeWeight(15);
    noFill();
    if(shape==0)oShape(x,y);
    else if(shape==1)xShape(x,y);
  }

  void xShape(float x, float y) {
    stroke(col);
    line(x+map.tileSize/4, y+map.tileSize/4, x+map.tileSize*3/4, y+map.tileSize*3/4);
    line(x+map.tileSize*3/4, y+map.tileSize/4, x+map.tileSize/4, y+map.tileSize*3/4);
  }

  void oShape(float x, float y) {
    stroke(col);
    ellipse(x+map.tileSize/2, y+map.tileSize/2, map.tileSize/2, map.tileSize/2);
  }
}