class Coin extends Creature
{
  public Coin(Box box)
  {
    myX = box.getX();
    myY = box.getY();
    myLenX = 2;
    myLenY = 3;
    myVX = (3 * Math.random()) - 1.5;
    myVY = -1 * Math.random();
  }
  public void show()
  { 
    stroke(230,230,0);
    fill(250,250,0);
    ellipse((float)myX + (myLenX /2),(float)myY + (myLenX/2),myLenX,myLenY);
    fill(255);
    stroke(0);
  }
}
