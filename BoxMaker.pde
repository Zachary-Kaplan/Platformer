class BoxMaker
{
  private int firstX, firstY;
  private boolean hasClicked;
  public BoxMaker()
  {
    hasClicked = false;
    firstX = 0;
    firstY = 0;
  }
  public void startNewBox(int x, int y)
  {
    firstX = x;
    firstY = y;
    hasClicked = true;
  }
  public Platform endNewBox(int x, int y)
  {
    if(x < firstX)
    {
      if(y < firstY)
      {
        hasClicked = false;
        System.out.println("Platforms.add(new Platform(" + x + "," + y + "," + (firstX - x) + "," + (firstY - y) + "))");
        return new Platform(x,y,firstX - x, firstY - y);
      } else
      {
        hasClicked = false;
        System.out.println("Platforms.add(new Platform(" + x + "," + firstY + "," + (firstX - x) + "," + (y - firstY) + "))");
        return new Platform(x,firstY, firstX - x, y - firstY);
      }
    } else
    { 
      if(y < firstY)
      {
        hasClicked = false;
        System.out.println("Platforms.add(new Platform(" + firstX + "," + y + "," + (x - firstX) + "," + (firstY - y) + "))");
        return new Platform(firstX,y,x - firstX, firstY - y);
      } else
      {
        hasClicked = false;
        System.out.println("Platforms.add(new Platform(" + firstX + "," + firstY + "," + (x - firstX) + "," + (y - firstY) + "))");
        return new Platform(firstX,firstY,x - firstX, y - firstY);
      }
    }
  }
  public boolean getClicked()
  {
    return hasClicked;
  }
}
