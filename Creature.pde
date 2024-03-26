class Creature extends Box
{
  protected int myHP, iFrames;
  protected boolean isGrounded, isMoving, isFacingLeft;
  public Creature()
  {
  myX = 900;
  myY = 50;
  myLenX = 5;
  myLenY = 10;
  myVX = 0;
  myVY = 0;
  myHP = 10;
  iFrames = 0;
  isGrounded = false;
  isFacingLeft = false;
  }

  public void show()
  {
    fill(0,255,0);
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
  public int getHP()
  {
    return myHP;
  }
  public int getIFrames()
  {
    return iFrames;
  }
  public void takeDamage(int damage, Creature source)
  {
    if(iFrames <= 0)
    {
      myHP-=damage;
      iFrames = 3 * (int)frameRate;
      myVY = -0.35;
      if(myX > source.getX())
      {
        myVX = 5.35;
      } else
      {
        myVX = -5.35;
      }
    }
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
