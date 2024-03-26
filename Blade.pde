class Blade extends Box
{
  protected boolean isFacingLeft;
  public Blade(Player player)
  {
  myLenX = 10;
  myLenY = 3;
  myVX = 0;
  myVY = 0;
  isFacingLeft = player.getFacing();
  myY = player.getCenterY();
  if(isFacingLeft)
  {
    myX = player.getX() - myLenX;
  } else
  {
    myX = player.getX() + player.getLenX();
  }
  }
  public void show(Player player)
  {
    isFacingLeft = player.getFacing();
    myY = player.getCenterY();
    if(isFacingLeft)
    {
      myX = player.getX() - myLenX;
    } else
    {
      myX = player.getX() + player.getLenX();
    }
    super.show();
  }
}
