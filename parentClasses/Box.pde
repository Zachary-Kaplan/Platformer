class Box
{
  protected double myX, myY, myVX, myVY;
  protected int myLenX, myLenY;
  public Box()
  {
  myX = 500;
  myY = 500;
  myLenX = 5;
  myLenY = 10;
  myVX = 0;
  myVY = 0;
  }
  public void show()
  {
    rect((float)myX,(float)myY,myLenX,myLenY);
  }
  
  public double getX()
  {
  return myX;
  }
  public double getY()
  {
  return myY;
  }
  public int getLenX()
  {
    return myLenX;
  }
  public int getLenY()
  {
    return myLenY;
  }
  public double getCenterX()
  {
    return myX + (myLenX / 2);
  }
  public double getCenterY()
  {
    return myY + (myLenY / 2);
  }
  public double getVX()
  {
  return myVX;
  }
  public double getVY()
  {
  return myVY;
  }
}
