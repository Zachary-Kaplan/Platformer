Player John;
void setup()
{
  John = new Player();
  size(1000,1000);
}

void draw()
{
  rect(0,900,1000,1000);
  if((int)John.getY() >= 900)
  {
    John.setGrounded(true);
    John.setY(900);
  } else
  {
    John.setGrounded(false);
  }
  System.out.println(John.myY);
  John.show();
  John.gravity();
  John.move();
}

void keyPressed()
{
  if(key == 'a')
  {
  John.walkL();
  } if(key == 'd')
  {
  John.walkR();
  }
  //if((key != 'd') && (key != 'a'))
  //{
  //  John.setWalk(false);
  //}
  if(key == 'w')
  {
    John.jump();
  }
}

void keyReleased()
{
  John.setWalk(false);
}
