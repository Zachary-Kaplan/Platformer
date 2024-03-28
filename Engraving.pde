class Engraving
{
  protected String engraveType;
  public Engraving(String newEngraving)
  {
    engraveType = newEngraving;
  }
  public String getType()
  {
    return engraveType;
  }
  public void engraveFunction(Player player)
  {
    if(engraveType.equals("Strength"))
    {
      player.setDamage(2);
    } else
    {
      player.setDamage(1);
    }
    if(engraveType.equals("Wick"))
    {
      player.setWick(75);
    } else
    {
      player.setWick(50);
    }
    if(engraveType.equals("Coin"))
    {
      player.setCoinChance(0.5);
    } else
    {
      player.setCoinChance(0.25);
    }
  }
}
