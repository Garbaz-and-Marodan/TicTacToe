Player p1;
Player p2;

Game game;
Map map;
Canvas canvas;

void setup() {
  size(600, 900);
  // orientation(PORTRAIT); // only for Android
  p1 = new Player("Player 1", color(255, 0, 0), 1);
  p2 = new Player("Player 2", color(0, 255, 0), 0);

  game = new Game(p1);
  canvas = new Canvas();
  map = new Map();

  background(255);
  canvas.show();
}
void draw() {}

void mousePressed() {
  background(255);
  canvas.show();
}