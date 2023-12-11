public class Game
{
  // 
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
  public static final int DOT_SCORE= 10;
  public static final int ENERGIZER_SCORE= 100;

  // class variables
  private Pacman pacman;
  private GameData gameData;
  private Inky inky;

  private ArrayList<Dot> dots;

  public Game()
  {
    // create pacman
    pacman = new Pacman(new Location(1, 1)); 
    println(pacman);


    // create ghost Inky
    inky = new Inky(new Location(3, 6));    
    println(inky);


    // create dot(s) 
    dots = new ArrayList<Dot>();
    dots.add(new Dot(new Location(0, 0)));
    // use code in drawGrid() as a guide as how to create the 8x7(56) dots


    // create game data 
    gameData = new GameData();
  }

  public void action(int value)
  {
    switch(value)
    {
    case Game.LEFT:
    case Game.RIGHT:
    case Game.UP:
    case Game.DOWN:      
        pacman.move(true, value);
      break;
    }
  }

  public void update()
  {
    drawGrid();

    // display game data
    gameData.display();


    // draw dots
    for (Dot dot : dots)
      dot.display();


    // move & display ghost(s)
    if (!inky.moving()) {
      inky.move(true);
    }
    inky.display();


    // display pacman
    pacman.display();


    // check for pacman eating dot(s)      
    Dot dotEaten=null;
    for (Dot dot : dots)
    {
      if (pacman.eats(dot))
      {  
        dotEaten=dot;  // store dot eaten
        break;
      }
    }
    if (dotEaten!=null) 
    {
      dots.remove(dotEaten);  // remove the dot eaten
    }


    // check for ghost eating Pacman 
    if (inky.eats(pacman))
    {
      exit();
    }
  }

  public void drawGrid()
  {
    // blue outline
    fill(38, 38, 38);
    stroke(0, 0, 255);
    strokeWeight(5);  
    rect(0, 0, width, height-100);

    // draw dots locations
    ellipseMode(CENTER);
    strokeWeight(1);
    fill(135, 135, 135);
    stroke(135, 135, 135);
    for (int i=0; i<Game.GRID_COLS; i++)
      for (int j=0; j<Game.GRID_ROWS; j++)
        ellipse((100*i)+(Game.PACMAN_SIZE/2), (100*j)+(Game.PACMAN_SIZE/2), Game.DOTSIZE/2, Game.DOTSIZE/2);
  }
}
