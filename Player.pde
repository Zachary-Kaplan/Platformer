class Player extends Creature
{
  protected int swordCooldown, myCoin;
  protected int myWax, myMeltCD;
  public Player()
  {
  myX = 500;
  myY = 500;
  myLenX = 5;
  myLenY = 10;
  myVX = 0;
  myVY = 0;
  myWax = 45;
  myHP =50;
  isGrounded = false;
  swordCooldown = 0;
  iFrames = 0;
  myMeltCD = 0;
  myCoin = 0;
  }
 
  //controls
  public void walkL()
  {
  isMoving = true;
  isFacingLeft = true;
  if(myVX < -1.5)
  {
    //myVX+= 0.03;
  } else
  {
    myVX-= 0.03;
  }
  }
  public void walkR()
  {
  isMoving = true;
  isFacingLeft = false;
  if(myVX > 1.5)
  {
    //myVX-= 0.03;
  } else
  {
    myVX+= 0.03;
  }
  }
  public void jump(ArrayList<Platform> Platfor)
  {
    if(isGrounded)
    {
      myVY = -1.5;
      boolean collide = false;
      for(int i = 0; i < Platfor.size(); i++)
      {
        if(willCollide(this, Platfor.get(i)))
        {
          collide = true;
        }
      }
      if(!collide)
      {
        move();
        isGrounded = false;
      }
    }
  }
  public void attack()
  {
    swordCooldown = 2 * (int)frameRate;
  }
  public int getCooldown()
  {
    return swordCooldown;
  }
  public void decreaseCooldown(int num)
  {
    swordCooldown-=num;
  }
  public void changeCoin(int num)
  {
    myCoin += num;
  }
  public int getCoin()
  {
    return myCoin;
  }
  public int getWax()
  {
    return myWax;
  }
  public void takeDamage(int damage, Creature source)
  {
    if(iFrames <= 0)
    {
      myWax-=damage;
      iFrames = 3 * (int)frameRate;
      myVY = -0.35;
      if(myX > source.getX())
      {
        myVX = 0.7;
      } else
      {
        myVX = -0.7;
      }
    }
  }
  public void burn(int num)
  {
    if(myWick - myWax < 3)
    {
      myWax-=num;
    } else if(myWick <  myWax)
    {
      myWax = myWick - 3;
    }else if(myWick - myWax >= 3)
    {
      myWick-=num;
      burnCoolDown = (int)frameRate
    }
    if(myWick - myWax > 10)
    {
      myWick-=num;
    }
  }
  public void burnDecrease(int num)
  {
    burnCooldown-=num;
  }

}
