class Player extends Creature
{
  protected int swordCooldown, myMeltCD;
  protected int myWax, myCoin;
  protected int maxWax, maxWick, burnSpeed, damage;
  public Player()
  {
  myX = 500;
  myY = 500;
  myLenX = 5;
  myLenY = 10;
  myVX = 0;
  myVY = 0;
  maxWax = 45;
  maxWick = 50;
  myWax = maxWax;
  myHP =maxWick;
  isGrounded = false;
  swordCooldown = 0;
  iFrames = 0;
  myMeltCD = 0;
  myCoin = 0;
  damage = 1;
  burnSpeed = 1;
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
    swordCooldown = (int)frameRate;
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
  public int getMaxWax()
  {
    return maxWax;
  }
  public int getMaxWick()
  {
    return maxWick;
  }
  public int getDamage()
  {
    return damage;
  }
  public int getBurnSpeed()
  {
    return burnSpeed;
  }
  public int getMeltCD()
  {
    return myMeltCD;
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
    myMeltCD = (int)frameRate;
    if(myHP - myWax < 5)
    {
      myWax-=num;
    } else if(myHP <  myWax)
    {
      myWax = myHP - 3;
    }else if(myHP - myWax >= 5)
    {
      myHP-=num;
    }
    if((myHP - myWax > 10) || (myWax < 0))
    {
      myHP-=num;
    }
  }
  public void burnDecrease(int num)
  {
    myMeltCD-=num;
  }
  public void setHP(int num)
  {
    myHP = num;
  }
  public void setWax(int num)
  {
    myWax = num;
  }
  public void setDamage(int num)
  {
    damage = num;
  }
}
