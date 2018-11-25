
public class paraClass 
{
	public String paraType;
	public String paraName;
	public paraClass()
	{
		paraType = paraName = null;
	}
	public paraClass(final String _paraType, final String _paraName)
	{
		paraType = _paraType;
		paraName = _paraName;
	}
	public String outputStr()
	{
		return "{paraType:" + paraType + ", paraName:" + paraName + "}";
	}
}
