Player p1;
Player p2;

Game game;
Map map;
Canvas canvas;

int i = 0;
int countP1 = 0, countP2 = 0, countDraw = 0;
void setup() {
  frameRate(10);
  size(600, 900);
  // orientation(PORTRAIT); // only for Android
  p1 = new Player("Player 1", color(255, 0, 0), 1);
  p2 = new Player("Player 2", color(0, 255, 0), 0);

  game = new Game(p1);
  canvas = new Canvas();
  map = new Map();
  
  //println("P1: " + countP1 + ", P2: " + countP2 + ", Draw: " + countDraw);

}
void draw() {
    for(int j = 0; j < 9; j++) {
      if((i & (1<<j)) != 0) map.field[j/3][j%3].owner = p1;
      else map.field[j/3][j%3].owner = p2;
    }
    Player w = map.checkWinner(); 
    if(w == p1) {
      countP1++;
    }
    else if(w == p2) {
      countP2++;
    }
    else {
      countDraw++;
    }
    
    i++;
    background(255);
    canvas.show();
    textAlign(CENTER,CENTER);
    if(w != null) text("Winner: " + w.name,width/2,height/16);
    else text("Winner: DRAW",width/2,height/16);
    text("P1: " + countP1 + ", P2: " + countP2 + ", Draw: " + countDraw,width/2,height*1/8);
    if(i>=(1<<9))noLoop();
}

void mousePressed() {
  background(255);
  canvas.show();
}