
class Game {
  int state; // 1=running, 0=end, -1=idle
  int click;
  Player onTurn;
  Player winner;

  Game(Player player) {
    state = 1;
    onTurn = player;
  }

  void newGame() {
    winner = null;
    map.refresh();
  }

  void turn() {
    if (onTurn == p1) onTurn = p2;
    else if (onTurn == p2) onTurn = p1;
  }

  void checkMap(float mX, float mY) {
    for (int x=0; x<map.field.length; x++) {
      for (int y=0; y<map.field[0].length; y++) {
        map.field[x][y].check(mX, mY, x*canvas.size/3, y*canvas.size/3);
      }
    }
  }

  void rules() {
    winner = map.checkWinner();
    if (winner!=null || map.freeTiles==0) state = 0;
  }

  void showEnd() {
    textSize(50);
    // fade background
    fill(255, 255, 255, 150); 
    noStroke();
    rect(0, -canvas.yPos, width, height);
    // set banner-color to winners color
    if (winner != null)fill((winner.col & 0xffffff) | (50 << 24) ); 
    // else make it purple
    else fill(255, 0, 255, 50);

    noStroke();
    rect(0, canvas.size/4, canvas.size, canvas.size/2);
    // draw white stripe on top of that
    fill(255, 255, 255, 100);
    rect(0, canvas.size*2/5, canvas.size, canvas.size*1/5);
    // draw borders of the banner
    stroke(0); 
    strokeWeight(7);
    line(0, canvas.size/4, canvas.size, canvas.size/4);
    line(0, canvas.size*3/4, canvas.size, canvas.size*3/4);
    // write End-text
    drawText();
  }

  void drawText() {
    textAlign(CENTER, CENTER);
    if (winner!=null) {
      fill(winner.col);
      text(winner.name+" wins", canvas.size/2, canvas.size/2);
    } else {
      fill(255, 0, 255);
      text("Draw", canvas.size/2, canvas.size/2);
    }
  }
}