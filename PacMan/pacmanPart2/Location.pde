public class Location
{
  private int x;
  private int y;

  public Location(int x, int y)
  {
    this.x=x;
    this.y=y;
  } 

  public int getX()
  {
    return x;
  }

  public int getY()
  {
    return y;
  }
  
  public void updateLocation(int bearing)
  {
    switch(bearing)
    {
    case Game.RIGHT: 
      this.x+=1; 
      break; 
    case Game.LEFT: 
      this.x-=1; 
      break;
    case Game.DOWN: 
      this.y+=1; 
      break;
    case Game.UP:
      this.y-=1; 
      break;
    }
  }
  
  public int[] getXY()  // given a grid [row,col] location  returns screen (x,y) location
  {
    int[] xy = {this.x*Game.Pacman_STEP*(int)Game.SPEED,this.y*Game.Pacman_STEP*(int)Game.SPEED};
    return xy;
  }
  
}
