import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.StringTokenizer;
import java.util.TreeMap;

public class StatReader
{
	//可能需要做一个排序。。。？
	//先创建一个文件列表, 每个文件包含了若干函数
	public static TreeMap<String, String> funcCalledFile = new TreeMap<>();
	//调用函数a的文件x, 文件x中调用a的函数b, b在哪一行调用a, 以及调用的次数 
	public static void handle(ArrayList<ArrayList<callMessage>> ans)
	{
		
		for(ArrayList<callMessage> callStack:ans)
		{
			int len = callStack.size();
			if(len == 0)continue;
			String iFunc = callStack.get(0).callFunc;
			String iFile = callStack.get(0).callFile;
			for(int i=1;i<len;i++)
			{
				callMessage mess = callStack.get(i);
				
			}
		}
	}
	
	
	public static ArrayList<ArrayList<callMessage>> ReadLogFile(File f)
	{
		//String lastPath = getLastPath(f);
		String tp,s;
		ArrayList<ArrayList<callMessage>> ans = new ArrayList<>();
		try
		{
			BufferedReader br = new BufferedReader(new FileReader(f));
			while((s=br.readLine())!=null)
			{
				if(!s.contains("{"))
					continue;
				//System.out.println(s);
				br.readLine();
				StringBuilder input = new StringBuilder();
				while(s.length() > 0)
				{
					s = br.readLine();
					input.append(s);
				}
				StringTokenizer pound_tok = new StringTokenizer(input.toString(),"#");
				ArrayList<callMessage> nowCallStack = new ArrayList<>();
				while(pound_tok.hasMoreTokens())
				{
					tp = pound_tok.nextToken();
					//System.out.println(tp);
					//System.out.println("===============");
					StringTokenizer tok = new StringTokenizer(tp," ");
					String callFunc,callFile;
					int callLine;
					if(nowCallStack.isEmpty())
					{
						tok.nextToken();
						callFunc = tok.nextToken();
						nowCallStack.add(new callMessage(callFunc,null,0));
					}
					else
					{
						for(int i=0; i<3; i++)
							tok.nextToken();
						callFunc = tok.nextToken();
						if(callFunc.equals("??"))continue;
						//System.out.println(callFunc);
						while(tok.hasMoreTokens())
						{
							tp = tok.nextToken();
						}
						String[] tps = tp.split(":");
						callFile = tps[0];
						callLine = Integer.parseInt(tps[1]);
						nowCallStack.add(new callMessage(callFunc,callFile,callLine));
					}
				}
				//System.out.println(nowCallStack);
				ans.add(nowCallStack);
			}
			br.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
			return null;
		}
		return ans;
	}
	public static String getLastToken(String str, String delim)
	{
		StringTokenizer tok = new StringTokenizer(str, delim);
		String lastToken = "";
		while(tok.hasMoreTokens())
		{
			lastToken = tok.nextToken();
		}
		return lastToken;
	}

	public static void ReadFolder(String path, final int mode)
	{
		File f = null;
		File[] files = null;
		LinkedList<File> q = new LinkedList<>();
		LinkedList<File> myfiles = new LinkedList<>();
		q.add(new File(path));
		while(!q.isEmpty())
		{
			f = q.removeFirst();
			//System.out.println(f.getPath());
			if(f.isDirectory())
			{
				files = f.listFiles();
				for(File t:files)
				{
					if(t.isDirectory())
						q.addLast(t);
					else myfiles.addLast(t);
				}
			}
		}
		while((f=myfiles.pollFirst())!=null)
		{
			//System.out.println(f.getPath());
			switch(mode)
			{
			case 1:
				ReadLogFile(f);
				break;
			case 2:
				//srcReader srcR = new srcReader();
				//srcR.ReadSourceFile(f);
				break;
			default:
				break;
			}
			
		}
	}
}