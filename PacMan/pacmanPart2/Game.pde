public class Game {
  public static final int INITIAL_LIVES = 3;
  public static final int GRID_ROWS = 8;
  public static final int GRID_COLS = 7;
  public static final int PACMAN_SIZE = 40;
  public static final int Pacman_STEP = 50;
  public static final float SPEED = 2.0;
  public static final int LEFT = -1;
  public static final int RIGHT = 1;
  public static final int UP = -2;
  public static final int DOWN = 2;
  public static final int DOTSIZE = 10;
  public static final color YELLOW = #FFFF00;  // Pacman
  public static final color CYAN = #21FFD6;  // Inky
  public static final color RED = #FF0000;  // Blinky
  public static final color PINK = #FEA7D6;  // Pinky
  public static final color ORANGE = #FEAA38;  // Clyde
  public static final color BLUE = #0000FF;
  public static final int DOT_SCORE = 10;
  public static final int ENERGIZER_SCORE = 100;

  private Pacman pacman;
  private GameData gameData;
  private Inky inky;
  private ArrayList<Dot> dots;
  private ArrayList<Ghost> ghosts;
  private boolean dotEatenFlag = false;

  public Game() {
    pacman = new Pacman(new Location(1, 1));
    println(pacman);

    ghosts = new ArrayList<>();

    ghosts.add(new Inky(new Location(3, 6)));
    ghosts.add(new Blinky(new Location(3, 6)));
    ghosts.add(new Pinky(new Location(3, 6)));
    ghosts.add(new Clyde(new Location(3, 6)));

    dots = new ArrayList<Dot>();
    for (int i = 0; i < GRID_COLS; i++) {
      for (int j = 0; j < GRID_ROWS; j++) {
        dots.add(new Dot(new Location(i, j)));
      }
    }

    gameData = new GameData();
  }

  public void action(int value) {
    switch (value) {
      case LEFT:
      case RIGHT:
      case UP:
      case DOWN:
        if (pacman.validMove(pacman.getLocation(), value)) {
          pacman.move(true, value);
        }
        break;
    }
  }

  public void update() {
    drawGrid();
    gameData.display();

    for (Dot dot : dots)
      dot.display();

    for (Ghost ghost : ghosts) {
      if (!ghost.moving()) {
        ghost.move(true);
      }
      ghost.display();
    }

    pacman.display();

    Dot dotEaten = null;
    for (Dot currentDot : dots) {
      if (pacman.eats(currentDot)) {
        dotEaten = currentDot;
        dotEatenFlag = true;
        break;
      }
    }

    if (dotEaten != null) {
      dots.remove(dotEaten);
    }

    for (Ghost ghost : ghosts) {
      if (ghost.eats(pacman)) {
        exit();
      }
    }
  }

  public void drawGrid() {
    fill(38, 38, 38);
    stroke(0, 0, 255);
    strokeWeight(5);
    rect(0, 0, width, height - 100);

    ellipseMode(CENTER);
    strokeWeight(1);
    fill(135, 135, 135);
    stroke(135, 135, 135);
    for (Dot dot : dots) {
      int[] location = dot.getLocation().getXY();
      ellipse(location[0] * PACMAN_SIZE + (PACMAN_SIZE / 2), location[1] * PACMAN_SIZE + (PACMAN_SIZE / 2), DOTSIZE,
          DOTSIZE);
    }
  }
}
