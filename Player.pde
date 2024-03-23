class Player
{
  protected double myX, myY, myVX, myVY;
  protected int myHP;
  protected boolean isGrounded, isMoving;
 
  public Player()
  {
  myX = 500;
  myY = 500;
  myVX = 0;
  myVY = 0;
  myHP = 10;
  isGrounded = false;
  }
  public void show()
  {
  ellipse((float)myX,(float)myY,7,7);
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
  if(myVX < -1)
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
  if(myVX > 1)
  {
    //myVX-= 0.03;
  } else
  {
    myVX+= 0.03;
  }
  }
  public void jump()
  {
    if(isGrounded)
    {
      myVY = -1;
      move();
      isGrounded = false;
    }
  }
 
  //environmental dynamics
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
 
  public double getX()
  {
  return myX;
  }
  public double getY()
  {
  return myY;
  }
  public boolean getGrounded()
  {
  return isGrounded;
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
