class Enemy extends Creature
{
  public Enemy()
  {
    myX = 900 + (int)(10 * Math.random());
    myY = 50 + (int)(10 * Math.random());
    myLenX = 5;
    myLenY = 10;
    myVX = 0;
    myVY = 0;
    myHP = 10;
    isGrounded = false;
  }
  public void pathFind(Creature creature)
  {
    if(creature.getCenterX() < getCenterX())
    {
      walkL();
    }
    if(creature.getCenterX() > getCenterX())
    {
      walkR();
    }
    if(creature.getY() + creature.getLenY() < getCenterY())
    {
      jump();
    }
  }
}
