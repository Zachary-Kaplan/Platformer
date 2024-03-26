Player John;
Blade Sword;
BoxMaker Jimmy;
ArrayList<Platform> Platforms = new ArrayList<Platform>();
ArrayList<Enemy> Enemies = new ArrayList<Enemy>();
ArrayList<Coin> Coins = new ArrayList<Coin>();
public boolean up,left,right;
void setup()
{
  John = new Player();
  Sword = new Blade(John);
  Jimmy = new BoxMaker();
  for(int i = 0; i < 3; i++)
  {
    Enemies.add(new Enemy());
  }
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
    John.jump(Platforms);
  } if(left)
  {
    John.walkL();
  } if(right)
  {
    John.walkR();
  }
  John.show();
  John.gravity();
  if(John.getMeltCD() > 0)
  {
    John.burnDecrease(1);
  } else
  {
    John.burn(1);
  }
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
    for(int i = 0; i < Enemies.size(); i++)
    {
      if(willCollide(Sword,Enemies.get(i)))
      {
        Enemies.get(i).takeDamage(1,John);
        if(Enemies.get(i).getHP() <= 0)
        {
          for(int j = 0; j < (int)(3 * Math.random()); j++)
          {
            Coins.add(new Coin(Enemies.get(i)));
          }
          Coins.add(new Coin(Enemies.get(i)));
          Enemies.remove(i);
        }
      }
    }
  }
  if(John.getIFrames() > 0)
  {
    John.iFrameDecrease(1);
  }
  
  for(int i = 0; i < Enemies.size(); i++)
  {
    Enemies.get(i).pathFind(John,Platforms);
    Enemies.get(i).gravity();
    Enemies.get(i).show();
    if(Enemies.get(i).getIFrames() > 0)
    {  
      Enemies.get(i).iFrameDecrease(1);
    }
    boolean collidesEnemyPlatform = false;
    boolean collidesEnemyPlayer = false;
    for(int j = 0; j < Platforms.size(); j++)
    {
      Platforms.get(j).show();
      if(willCollide(Enemies.get(i), Platforms.get(j)))
      {
        collidesEnemyPlatform = true;
      }
      if(willCollide(Enemies.get(i),John))
      {
        collidesEnemyPlayer = true;
      }
    }
    Enemies.get(i).setGrounded(collidesEnemyPlatform);
    if(collidesEnemyPlayer)
    {
      John.takeDamage(5,Enemies.get(i));
    }
    if(!collidesEnemyPlatform)
    {
      Enemies.get(i).move();
    }
  }
  for(int i = 0; i < Coins.size(); i++)
  {
    Coins.get(i).gravity();
    Coins.get(i).show();
    boolean collidesCoinPlatform = false;
    boolean collidesCoinPlayer = false;
    for(int j = 0; j < Platforms.size(); j++)
    {
      if(willCollide(Coins.get(i), Platforms.get(j)))
      {
        collidesCoinPlatform = true;
      }
      if(willCollide(Coins.get(i),John))
      {
        collidesCoinPlayer = true;
      }
    }
    Coins.get(i).setGrounded(collidesCoinPlatform);
    if(!collidesCoinPlatform)
    {
      Coins.get(i).move();
    }
    if(collidesCoinPlayer)
    {
      John.changeCoin(1);
      Coins.remove(i);
      i--;
    }
  }
  fill(250,0,0);
  text("Wick: " + John.getHP(), (float)John.getX(), (float)(John.getY() - 5));
  text("Wax: " + John.getWax(), (float)John.getX(), (float)(John.getY() - 15));
  text("Coins: " + John.getCoin(), (float)John.getX(), (float)(John.getY() - 25));
  fill(255);
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

void mousePressed()
{
  if(Jimmy.getClicked())
  {
    Platforms.add(Jimmy.endNewBox(mouseX, mouseY));
  } else
  {
    Jimmy.startNewBox(mouseX, mouseY);
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
