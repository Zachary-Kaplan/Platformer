class Helm
{
  protected int maxEngrav;
  protected ArrayList<Engraving> myEngrav;
  public Helm(int mEngrave)
  {
    maxEngrav = mEngrave;
  }
  public void addEngrave(Engraving newEngrav)
  {
    if(myEngrav.size() < maxEngrav)
    {
      myEngrav.add(newEngrav);
    }
  }
  public void removeEngrave(String newEngrave)
  {
    for(int i = 0; i < myEngrav.size(); i++)
    {
      if(myEngrav.get(i).getType().equals(newEngrave))
      {
        myEngrav.remove(i);
        break;
      }
    }
  }
}
