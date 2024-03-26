class Creature extends Box
{
  protected int iFrames, burnCooldown;
  protected int myWick, myWax;
  protected boolean isGrounded, isMoving, isFacingLeft;
  public Creature()
  {
  myX = 900;
  myY = 50;
  myLenX = 5;
  myLenY = 10;
  myVX = 0;
  myVY = 0;
  myWick = 50;
  myWax = 30;
  iFrames = 0;
  isGrounded = false;
  isFacingLeft = false;
  }

  public void show()
  {
    if(iFrames > 0)
    {
      fill(0,0,255);
    }
    super.show();
    fill(255);
  }
  public void move()
  {
    myX += myVX;
    myY += myVY;
  }
  
  //controls
  public void walkL()
  {
  isMoving = true;
  myVX = -0.5;
  isFacingLeft = true;
  }
  public void walkR()
  {
  isMoving = true;
  myVX = 0.5;
  isFacingLeft = false;
  }
  public void jump(ArrayList<Platform> Platfor)
  {
    if(isGrounded)
    {
      myVY = -0.8;
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
  
  //dynamics
  public void gravity()
  {
  if(isGrounded)
  {
    myVY = 0;
    if(!isMoving)
    {
      if(myVX > 0.1)
      {
        myVX-=0.06;
      } else if(myVX < -0.1)
      {
        myVX+=0.06;
      } else
      {
        myVX = 0;
      }
    }
  } else
  {
    myVY+=0.03;
  }
  }
  
  
  public boolean getGrounded()
  {
  return isGrounded;
  }
  public boolean getFacing()
  {
    return isFacingLeft;
  }
  public int getWick()
  {
    return myWick;
  }
  public int getWax()
  {
    return myWax;
  }
  public int getIFrames()
  {
    return iFrames;
  }
  public int getBurnCD()
  {
    return burnCoolDown;
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
  public void melt(int num)
  {
    if(myWick - myWax < 5)
    {
      myWax-=num;
    }
  }
  public void burn(int num)
  {
    if(myWick - myWax > 10)
    {
      myWick-=num;
    }
    myWick-=num;
    burnCooldown = (int)frameRate;
  }
  public void burnDecrease(int num)
  {
    burnCooldown-=1;
  }
  public void iFrameDecrease(int num)
  {
    iFrames-=num;
  }
  public void setX(int X)
  {
    myX = X;
  }
  public void setY(int Y)
  {
    myY = Y;
  }
  public void setGrounded(boolean groundState)
  {
  isGrounded = groundState;
  }
  public void setWalk(boolean walkState)
  {
  isMoving = walkState;
  }
}
