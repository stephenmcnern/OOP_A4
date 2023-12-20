public class GameCharacter {

    private Location location;

    public GameCharacter(Location location) {
        this.location = location;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "[GameCharacter:location=(" + location.getX() + "," + location.getY() + ")]";
    }

}
