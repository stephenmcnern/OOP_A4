public class GameData
{
  private int score;
  private int lives;

  public GameData()
  {
    score=0;
    lives=Game.INITIAL_LIVES;
  }
  public void setScore(int score) {
    this.score = score;
  }

  public int getScore() {
    return score;
  }
  public void incScore(int scoreToAdd) {
    this.score += scoreToAdd;
  }
  public int getLives() {
    return lives;
  }
  public void setLives(int lives) {
    this.lives = lives;
  }
  public void addLife() {
    this.lives++;
  }
  public void loseLife() {
    if (lives > 0) {
      this.lives--;
    }
  }
  public String toString() {
    return "[GameData:score=" + score + ", lives=" + lives + "]";
  }



  /////////////////////////////////////////////////////////////////////////////////////////////

  //
  // Add your code ABOVE this method
  //

  public void display()
  {
    // data area colour bar
    fill(14, 0, 189);
    rect(0, height-100, width, height);

    textSize(28);
    fill(255);
    // display lives and score
    text("SCORE: 0", 5, height-10);
    text("LIVES: 3", width-110, height-10);

    // display minature pacman icons here
    float pacmanSize = Game.PACMAN_SIZE;

    // Small Icon for the bottom of scren
    pushMatrix();
    translate(width - 160, height - 40);
    fill(Game.YELLOW);
    arc(0, 0, pacmanSize, pacmanSize, QUARTER_PI, PI + HALF_PI + QUARTER_PI, PIE);
    popMatrix();

    
    pushMatrix();
    translate(width - 200, height - 40);
    fill(Game.YELLOW);
    arc(0, 0, pacmanSize, pacmanSize, QUARTER_PI, PI + HALF_PI + QUARTER_PI, PIE);
    popMatrix();

  }
}
