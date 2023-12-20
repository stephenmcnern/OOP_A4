public class Inky extends Ghost {

  public Inky(Location location) {
    super(location);
    int xy[] = location.getXY();
    this.x = xy[0];
    this.y = xy[1];
    this.colour = Game.CYAN;
    this.direction = 1;
    this.speed = Game.SPEED;
    this.distanceMoved = 0;
    this.moving = false;
    this.bearing = Game.RIGHT;

  }

  public String toString() {
    return "[Inky:location=[Location:(" + x + "," + y + ")], direction=" + direction + ", speed=" + speed + ", moving="
        + moving + ", bearing=" + bearing + "]";
  }

  /////////////////////////////////////////////////////////////////////////////////////////////

  //
  // Add your code ABOVE this method
  //

  public void incX() {
    setX(getX() + (this.direction * (int) this.speed));
  }

  public void incY() {
    setY(getY() + (this.direction * (int) this.speed));
  }

  public void display() // CAREFUL IF YOU MODIFY THIS CODE!!
  {
    if (moving) {
      if (this.distanceMoved != Game.Pacman_STEP) {
        this.distanceMoved++;
        if (this.bearing == Game.LEFT || this.bearing == Game.RIGHT)
          incX();
        if (this.bearing == Game.UP || this.bearing == Game.DOWN)
          incY();
      } else {
        this.distanceMoved = 0;
        moving = false;
      }
    }

    stroke(this.colour);
    fill(this.colour);

    pushMatrix();
    translate(getX(), getY());

    rect(0, Game.PACMAN_SIZE / 2, Game.PACMAN_SIZE, Game.PACMAN_SIZE / 2);
    arc(Game.PACMAN_SIZE / 2, Game.PACMAN_SIZE / 2, Game.PACMAN_SIZE, Game.PACMAN_SIZE, PI, PI * 2, PIE);

    fill(255, 255, 255);
    ellipse(Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 2, 15, 20);
    ellipse(Game.PACMAN_SIZE - Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 2, 15, 20);

    fill(0, 0, 0);
    stroke(0, 0, 0);
    // ellipse(Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 10, 10);
    // ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 10, 10);
    switch (this.bearing) {
      case Game.RIGHT:
        ellipse(Game.PACMAN_SIZE / 2 - (Game.PACMAN_SIZE / 8), Game.PACMAN_SIZE / 2, 10, 10);
        ellipse(Game.PACMAN_SIZE - Game.PACMAN_SIZE / 2 / 2 + (Game.PACMAN_SIZE / 10), Game.PACMAN_SIZE / 2, 10, 10);
        break;
      case Game.LEFT:
        ellipse(Game.PACMAN_SIZE / 2 / 2 / 2, Game.PACMAN_SIZE / 2, 10, 10);
        ellipse(Game.PACMAN_SIZE - Game.PACMAN_SIZE / 2 / 2 - (Game.PACMAN_SIZE / 8), Game.PACMAN_SIZE / 2, 10, 10);
        break;
      case Game.DOWN:
        ellipse(Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 2 + (Game.PACMAN_SIZE / 5), 10, 10);
        ellipse(Game.PACMAN_SIZE - Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 2 + (Game.PACMAN_SIZE / 5), 10, 10);
        break;
      case Game.UP:
        ellipse(Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 3, 10, 10);
        ellipse(Game.PACMAN_SIZE - Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 3, 10, 10);
        break;

      default:
        ellipse(Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 2, 10, 10);
        ellipse(Game.PACMAN_SIZE - Game.PACMAN_SIZE / 2 / 2, Game.PACMAN_SIZE / 2, 10, 10);
    }

    popMatrix();
  }
}
