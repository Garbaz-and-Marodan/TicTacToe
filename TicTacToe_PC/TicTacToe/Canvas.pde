
class Canvas {
  float size;
  float yPos; // offset from top (to center the canvas)

  Canvas() {
    size = width;
    yPos = (height-size)/2;
  }

  void show() {
    // translate mouseCoordinates to match canvas
    float mX = mouseX;
    float mY = mouseY-yPos;

    pushMatrix();
    translate(0, yPos);
    if (game.state==1) {
      game.checkMap(mX, mY);
      game.rules();
    }
    map.show();
    if (game.state==0) {
      game.showEnd();
      game.newGame();
      game.state = -1;
    } else if (game.state==-1)game.state=1;
    popMatrix();
  }
}