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
  }
}
