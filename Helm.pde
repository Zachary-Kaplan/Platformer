class Helm
{
  protected int maxEngraves;
  protected ArrayList<Engraving> myEngraves;
  public Helm(int mEngrave)
  {
    maxEngraves = mEngrave;
  }
  public void addEngrave(Engraving newEngrav)
  {
    if(myEngraves.size() < maxEngrav)
    {
      myEngraves.add(newEngrav);
    }
  }
  public void removeEngrave(String newEngrave)
  {
    for(int i = 0; i < myEngraves.size(); i++)
    {
      if(myEngraves.get(i).getType().equals(newEngrave))
      {
        myEngraves.remove(i);
        break;
      }
    }
  }
  public String getEngrave(int i)
  {
    return myEngraves.get(i);
  }
  public int getEngraveCount()
  {
    return myEngraves.size();
  }
  public void show()
  {
    for(int i = 0; i < myEngraves.size(); i++)
    {
      text(myEngraves.get(i),10, 15 + (15 * i));
    }
  }
  public void activateEngraves()
  {
    for(int i = 0; i < myEngraves.size(); i++)
    {
      myEngraves.get(i).
    }
  }
}
