public class GameData
{
  private int score;
  private int lives;

  public GameData()
  {
    score=0;
    lives=Game.INITIAL_LIVES;
  }
 
  

  /////////////////////////////////////////////////////////////////////////////////////////////

  //
  // Add your code ABOVE this method
  //

  public void display()
  {
    // data area colour bar
    fill(14, 0, 189);
    rect(0, height-100,width, height);

    textSize(28);
    fill(255);    
    // display lives and score
    text("SCORE: 0", 5, height-10); 
    text("LIVES: 3", width-110, height-10);

    // display minature pacman icons here
  }
}
