public class Energizer {
  
  // These variables are not in the diagram
  private int x;
  private int y;
  
  public Energizer(Location location){
    this.x = location.getX();
    this.y = location.getY();
  }

  
  public void display() {
    fill(0, 255, 0);
    noStroke();

    pushMatrix();    
    
    translate(x,y); 
    ellipse(0 + Game.PACMAN_SIZE/2, 0 + Game.PACMAN_SIZE/2, Game.DOTSIZE, Game.DOTSIZE);
    
    popMatrix();
  }
}
