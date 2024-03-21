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
 	System.out.println(John.getGrounded());
  } else
  {
	John.setGrounded(false);
  }
  John.show();
  System.out.println(John.myVX);
  John.move();
  John.gravity();
}
void keyPressed()
{
  if(key == 'a')
  {
	John.walkL();
  } else if(key == 'd')
  {
	John.walkR();
  } else
  {
	John.setWalk(false);
	if(key == 'w')
	{
  	John.jump();
	}
  }
}
