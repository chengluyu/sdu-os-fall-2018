import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class srcReader 
{
	public char[] buf = null;
	private ArrayList<intPair> funcPos = null;
	private ArrayList<Integer> funcEndPos = new ArrayList<Integer>();
	public ArrayList<funcClass> func = new ArrayList<>();
	private File f;
	//public boolean is_Print = false;
	public srcReader(final String path, final boolean isPrint)
	{
		f = new File(path);
		ReadSourceFile(isPrint);
		readFuncName(isPrint);
	}
	
	private int forReadleft(int i, final char cl, final char cr)
	{
		int left=1, right=0;
		while(i<buf.length && left > right)
		{
			if(buf[i] == cl)left++;
			else if(buf[i] == cr)right++;
			i++;
		}
		return i;
	}
	
	public String outputStr()
	{
		StringBuilder build = new StringBuilder();
		build.append("{\nfile:");
		build.append(f.getName());
		build.append(",\n");
		for(int i=0; i<func.size(); i++)
		{
			build.append("function:");
			build.append(func.get(i).outputStr());
			if(i<func.size()-1)
			{
				build.append(',');
			}
			build.append("\n");
		}
		build.append("}");
		return build.toString();
	}
	
	private void countLine()
	{
		//int l=0, r=func
		int p=0, linecnt=0;
		for(int i=0;i<funcPos.size();i++)
		{
			int t=funcPos.get(i).a;
			while(p<t)
			{
				if(buf[p]=='\n')linecnt++;
				p++;
			}
			func.get(i).startline=linecnt;
			t=funcEndPos.get(i);
			while(p<t)
			{
				if(buf[p]=='\n')linecnt++;
				p++;
			}
			func.get(i).spanline=linecnt-func.get(i).startline;
		}
	}
	
	public void readFuncName(final boolean isPrint)
	{
		for(int i=0;i<funcPos.size();i++)
		{
			intPair now = funcPos.get(i);
			int j=now.a;
			for(int tp=0;tp<2;tp++)
			{
				if(j+6<now.b && buf[j]=='i' && buf[j+1]=='n' && buf[j+2]=='l'
						&& buf[j+3]=='i' && buf[j+4]=='n' && buf[j+5]=='e')
				{
					j += 6;
				}
				else if(j+6<now.b && buf[j]=='s' && buf[j+1]=='t' && buf[j+2]=='a' && buf[j+3]=='t'
						&& buf[j+4]=='i' && buf[j+5]=='c')
				{
					j +=6;
				}
			}
			int p1=j;
			while(j<buf.length && buf[j]!='(')j++;
			int p2=j-1,p22=j-1;
			while(p2>p1 && buf[p2]==' ')p2--;
			while(p2>p1 && buf[p2]!=' ')p2--;
			StringBuilder sbuild = new StringBuilder();
			funcClass nowFunc = new funcClass();
			if(isPrint)
			{
				System.out.print("Function return type:");
			}
			//nowFunc.charCnt = p1;
			for(int tp=p1;tp<p2;tp++)
			{
				sbuild.append(buf[tp]);
				//System.out.print(buf[tp]);
			}
			nowFunc.returnType = sbuild.toString();
			if(isPrint)
			{
				System.out.print(nowFunc.returnType);
			}
			sbuild.delete(0, sbuild.length());
			
			if(isPrint)
			{
				System.out.print(", Function name:");
			}
			for(int tp=p2+1;tp<j;tp++)
			{
				sbuild.append(buf[tp]);
				//System.out.print(buf[tp]);
			}
			nowFunc.funcName = sbuild.toString();
			if(isPrint)
			{
				System.out.print(nowFunc.funcName);
			}
			sbuild.delete(0, sbuild.length());
			
			while(j+1<now.b)
			{
				//while(j<now.b)
				p1=++j;
				while(j<now.b && buf[j]!=',' && buf[j]!='(')j++;
				if(buf[j]=='(')//函数指针
				{
					while(buf[j]!='*')j++;
					j++;
					while(buf[j]==' ')j++;
					p1=j;
					while(buf[j]!=')')j++;
					p2=j;
					if(isPrint)
					{
						System.out.print(", paraType:");
					}
					sbuild.append("function pointer");
					paraClass para = new paraClass();
					para.paraType = sbuild.toString();
					if(isPrint)
					{
						System.out.print(para.paraType);
					}
					sbuild.delete(0, sbuild.length());
					
					if(isPrint)
					{
						System.out.print(", paraName:");
					}
					for(int tp=p1;tp<p2;tp++)
					{
						sbuild.append(buf[tp]);
						//System.out.print(buf[tp]);
					}
					para.paraName = sbuild.toString();
					if(isPrint)
					{
						System.out.print(para.paraName);
					}
					sbuild.delete(0, sbuild.length());
					
					nowFunc.para.add(para);
					while(buf[j]!='(')j++;
					while(buf[j]!=')')j++;
					j++;
					continue;
				}
				p2=j;
				while(p2>p1 && buf[p2]==' ')p2--;
				int p3=p2;
				while(p2>p1 && buf[p2]!=' ')p2--;
				//p2++;
				while(p2>p1 && buf[p1]==' ')p1++;
				
				while(buf[p1]==' ')p1++;
				p22=p2;
				while(buf[p22]==' ')p22++;
				while(buf[p22]=='*')
				{
					p2=++p22;
				}
				if(buf[p3-1]==')')p3--;
				if(p1==p2 || p22==p3)continue;
				if(isPrint)
				{
					System.out.print(", paraType:");
				}
				paraClass para = new paraClass();
				
				for(int tp=p1;tp<p2;tp++)
				{
					sbuild.append(buf[tp]);
					//System.out.print(buf[tp]);
				}
				para.paraType = sbuild.toString();
				if(isPrint)
				{
					System.out.print(para.paraType);
				}
				sbuild.delete(0, sbuild.length());
				
				if(isPrint)
				{
					System.out.print(", paraName:");
				}
				
				for(int tp=p22;tp<p3;tp++)
				{
					//System.out.print(buf[tp]);
					sbuild.append(buf[tp]);
				}
				para.paraName = sbuild.toString();
				if(isPrint)
				{
					System.out.print(para.paraName);
				}
				
				sbuild.delete(0, sbuild.length());
				
				nowFunc.para.add(para);
			}
			func.add(nowFunc);
			if(isPrint)
			{
				System.out.println();
			}
		}
		countLine();
	}
	
	public void ReadSourceFile(final boolean isPrint)
	{
		//读取原代码的信息
		//源代码是用{}配对的, 所以,,可以考虑逐个读入字符, 然后比较{}是否配对
		if(!f.getName().endsWith(".c"))
		{
			return;
		}
		funcPos = new ArrayList<>();
		try
		{
			BufferedReader br = new BufferedReader(new FileReader(f));
			buf = new char[(int) f.length()];
			br.read(buf);
			int i = 0, p1 = 0, p2 = 0;
			int last = 0;
			while(i<buf.length)
			{
				switch(buf[i])
				{
				case '#':
					while(i<buf.length && buf[i] != '\n')i++;
					last = i+1;
					break;
				case '{':	
					p2 = i++;
					i=forReadleft(i,'{','}');
					
					while(i<buf.length && (buf[i]==' ' || buf[i]=='\t'))i++;
					if(i>=buf.length)i=buf.length-1;
					if(buf[i]!=';')
					{
						for(p1=p2; p1>=last && (buf[p1]!=';'); p1--);
						for(;buf[p1]<'a' || buf[p1]>'z';p1++);
						
						//in sched.c, print extra struct at 3th
						boolean flag = false;
						for(int j=p1;j<p2-1;j++)
						{
							if(buf[j]=='(')flag = true;
						}
						if(flag)
						{
							if(isPrint)
							{
								for(int j=p1;j<p2-1;j++)
									System.out.print(buf[j]);
								System.out.println();
							}
							funcEndPos.add(i);
							funcPos.add(new intPair(p1,p2-1));
						}
						last = --i;
					}
					break;
				case '/':
					if(i+1<buf.length && buf[i] == '/' && buf[i+1] == '*')
					{
						while(i+1<=buf.length && (buf[i] != '*' || buf[i+1] !='/'))i++;
						i ++;
						last = i+1;
					}
					break;
				default:
					//while(i<buf.length && buf[i]!=';')i++;
					break;
				}
				i++;
			}
			br.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}
}
