class Lantern extends Box
{
  protected boolean isSeated;
  public  Lantern(int x, int y)
  {
    myX = x;
    myY = y;
    myLenX = 15;
    myLenY = 15;
    myVX = 0;
    myVY = 0;
    isSeated = false;
  }
  public void sitDown(Player player)
  {
    if(dist((float)myX,(float)myY,(float)player.getX(),(float)player.getY()) < 21)
    {
      player.setHP(player.getMaxWick());
      player.setWax(player.getMaxWax());
      isSeated = true;
    }
  }
  public void sittingDown(Player player)
  {
    player.setHP(player.getMaxWick());
    player.setWax(player.getMaxWax());
    player.setX((int)this.getCenterX() - (player.getLenX()/2));
    player.setY((int)this.getCenterY() - (player.getLenY()/2));
  }
  public boolean getSeated()
  {
    return isSeated;
  }
  public void setSeated(boolean bool)
  {
    isSeated = bool;
  }
}
