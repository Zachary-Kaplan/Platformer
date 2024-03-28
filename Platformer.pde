Player Will;
Blade Sword;
BoxMaker Jimmy;
Lantern Wisp;
Helm Armor;
ArrayList<Platform> Platforms = new ArrayList<Platform>();
ArrayList<Enemy> Enemies = new ArrayList<Enemy>();
ArrayList<Coin> Coins = new ArrayList<Coin>();
public boolean up,left,right;
void setup()
{
  Platforms = new ArrayList<Platform>();
  Will = new Player();
  Sword = new Blade(Will);
  Jimmy = new BoxMaker();
  Wisp = new Lantern(200,885);
  Armor = newHelm(2);
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
    Will.jump(Platforms);
  } if(left)
  {
    Will.walkL();
  } if(right)
  {
    Will.walkR();
  }
  Wisp.show();
  if(Wisp.getSeated())
  {
    Wisp.sittingDown(Will);
  }
  Will.show();
  Will.gravity();
  if(Will.getMeltCD() > 0)
  {
    Will.burnDecrease(Will.getBurnSpeed());
  } else
  {
    Will.burn(1);
  }
  boolean collidesPlayerPlatform = false;
  for(int i = 0; i < Platforms.size(); i++)
  {
    Platforms.get(i).show();
    if(willCollide(Will, Platforms.get(i)))
    {
      collidesPlayerPlatform = true;
    }
  }
  Will.setGrounded(collidesPlayerPlatform);
  if(!collidesPlayerPlatform)
  {
    Will.move();
  }
  if(Will.getCooldown() > 0)
  {
    Sword.show(Will);
    Will.decreaseCooldown(1);
    for(int i = 0; i < Enemies.size(); i++)
    {
      if(willCollide(Sword,Enemies.get(i)))
      {
        Enemies.get(i).takeDamage(Will.getDamage(),Will,Platforms);
        if(Enemies.get(i).getHP() <= 0)
        {
          for(int j = 0; j < 4; j++)
          {
            if(Math.random() < Will.getCoinChange())
            {
              Coins.add(new Coin(Enemies.get(i)));
            }
          }
          Coins.add(new Coin(Enemies.get(i)));
          Enemies.remove(i);
        }
      }
    }
  }
  if(Will.getIFrames() > 0)
  {
    Will.iFrameDecrease(1);
  }
  
  for(int i = 0; i < Enemies.size(); i++)
  {
    Enemies.get(i).pathFind(Will,Platforms);
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
      if(willCollide(Enemies.get(i),Will))
      {
        collidesEnemyPlayer = true;
      }
    }
    Enemies.get(i).setGrounded(collidesEnemyPlatform);
    if(collidesEnemyPlayer)
    {
      Will.takeDamage(5,Enemies.get(i));
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
      if(willCollide(Coins.get(i),Will))
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
      Will.changeCoin(1);
      Coins.remove(i);
      i--;
    }
  }
  fill(250,0,0);
  text("Wick: " + Will.getHP(), (float)Will.getX(), (float)(Will.getY() - 5));
  text("Wax: " + Will.getWax(), (float)Will.getX(), (float)(Will.getY() - 15));
  text("Coins: " + Will.getCoin(), (float)Will.getX(), (float)(Will.getY() - 25));
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
  if((key == ' ') && (Will.getCooldown() <= 0))
  {
    Will.attack();
  }
  if(key == 'e')
  {
    if(Wisp.getSeated())
    {
      Wisp.setSeated(false);
    } else
    {
      Wisp.sitDown(Will);
    }
  }
}

void keyReleased()
{
  Will.setWalk(false);
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
