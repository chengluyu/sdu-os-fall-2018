
public class callMessage 
{
	public final String callFunc;
	public final String callFile;
	public final int callLine;
	public callMessage(final String _callFunc, final String _callFile, final int _callLine)
	{
		callFunc = _callFunc;
		callFile = _callFile;
		callLine = _callLine;
	}
	@Override
	public String toString()
	{
		return "Call Func:" + callFunc + " Call File:" + callFile + " Call Line:" + callLine;
	}
}
