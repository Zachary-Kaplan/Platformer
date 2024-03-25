Player John;
Enemy Womp;
Blade Sword;
ArrayList<Platform> Platforms = new ArrayList<Platform>();
public boolean up,left,right;
void setup()
{
  Womp = new Enemy();
  John = new Player();
  Sword = new Blade(John);
  up = false;
  left = false;
  right = false;
  size(1000,1000);
  Platforms.add(new Platform(0,900,1000,100));
  Platforms.add(new Platform(700,890, 200, 15));
}

void draw()
{
  background(255);
  if(up)
  {
    John.jump();
  } if(left)
  {
    John.walkL();
  } if(right)
  {
    John.walkR();
  }
  John.show();
  John.gravity();
  boolean collidesPlayerPlatform = false;
  for(int i = 0; i < Platforms.size(); i++)
  {
    Platforms.get(i).show();
    if(willCollide(John, Platforms.get(i)))
    {
      collidesPlayerPlatform = true;
    }
  }
  John.setGrounded(collidesPlayerPlatform);
  if(!collidesPlayerPlatform)
  {
    John.move();
  }
  if(John.getCooldown() > 0)
  {
    Sword.show(John);
    John.decreaseCooldown(1);
    if(willCollide(Sword,Womp))
    {
      Womp.setY(10);
    }
  }
  
  
  Womp.pathFind(John);
  Womp.gravity();
  Womp.show();
  boolean collidesEnemyPlatform = false;
  boolean collidesEnemyPlayer = false;
  for(int i = 0; i < Platforms.size(); i++)
  {
    Platforms.get(i).show();
    if(willCollide(Womp, Platforms.get(i)))
    {
      collidesEnemyPlatform = true;
    }
    if(willCollide(Womp,John))
    {
      collidesEnemyPlayer = true;
    }
  }
  Womp.setGrounded(collidesEnemyPlatform);
  if(!collidesEnemyPlayer)
  {
    John.takeDamage(1);
  }
  if(!collidesEnemyPlatform)
  {
    Womp.move();
  }
}

void keyPressed()
{
  if(key == 'a')
  {
    left = true;
  } if(key == 'd')
  {
    right = true;
  }
  if(key == 'w')
  {
    up = true;
  }
  if((key == ' ') && (John.getCooldown() <= 0))
  {
    John.attack();
  }
}

void keyReleased()
{
  John.setWalk(false);
  if(key == 'a')
  {
    left = false;
  } if(key == 'd')
  {
    right = false;
  }
  if(key == 'w')
  {
    up = false;
  }
}

public boolean willCollide(Box creature, Box platform)
{
  if(isBetween((int)(creature.getX() + creature.getVX()), (int)platform.getX(),platform.getLenX()))
  {
    if(isBetween((int)(creature.getY() + creature.getVY()), (int)platform.getY(), platform.getLenY()))
    {
      return true;
    } else if(isBetween((int)(creature.getY() + creature.getLenY() + creature.getVY()), (int)platform.getY(), platform.getLenY()))
    {
      //player.setY(platform.getY() + player.getLenY());
      return true;
    } else
    {
      return false;
    }
  } else if(isBetween((int)(creature.getX() + creature.getLenX() + creature.getVX()), (int)platform.getX(),platform.getLenX()))
  {
    if(isBetween((int)(creature.getY() + creature.getVY()), (int)platform.getY(), platform.getLenY()))
    {
      return true;
    } else if(isBetween((int)(creature.getY() + creature.getLenY() + creature.getVY()), (int)platform.getY(), platform.getLenY()))
    {
      //player.setY(platform.getY() + player.getLenY());
      return true;
    } else
    {
      return false;
    }
  } else
  {
    return false;
  }
}

public boolean isBetween(int a, int b, int c)
{
  if((a > b) && (a < b + c))
  {
    return true;
  } else
  {
    return false;
  }
}
