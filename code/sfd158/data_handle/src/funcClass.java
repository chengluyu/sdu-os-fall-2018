import java.util.ArrayList;

public class funcClass 
{
	public String funcName;
	public String returnType;
	public int startline = 0;
	public int spanline = 0;
	public ArrayList<callMess> calls = new ArrayList<>();//先直接追加进去, 然后再慢慢处理
	//在某个类里集中添加, 对所有函数的处理?
	public ArrayList<paraClass> para = new ArrayList<>();
	public funcClass()
	{
		funcName = returnType = null;
	}
	public funcClass(final String _funcName, final String _returnType)
	{
		funcName = _funcName;
		returnType = _returnType;
	}
	public void handleCalls()
	{
		
	}
	public String outputStr()
	{
		StringBuilder build = new StringBuilder();
		build.append("{type:");
		build.append(returnType);
		build.append(",name:");
		build.append(funcName);
		build.append(",startline:");
		build.append(startline);
		build.append(",spanline:");
		build.append(spanline);
		build.append(",para:{");
		for(int i=0;i<para.size()-1;i++)
		{
			build.append(para.get(i).outputStr());
			build.append(", ");
		}
		if(para.size()>0)
			build.append(para.get(para.size()-1).outputStr());
		build.append("}}");
		return build.toString();
	}
}
