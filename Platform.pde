class Platform extends Box
{
  public Platform(int startX, int startY, int lengthX , int lengthY)
  {
    myX = startX;
    myY = startY;
    myLenX = lengthX;
    myLenY = lengthY;
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
}
