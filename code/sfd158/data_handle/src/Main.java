
public class Main 
{
	static final String srcf = "D:\\song\\document\\GitHub\\oldlinux-homework\\";
	public static void main(String[] args) 
	{
		//StatReader.ReadFolder(srcf + "data\\gdb_output");
		//ArrayList<ArrayList<callMessage>> ans = StatReader.ReadLogFile(new File(srcf+"data\\gdb_output\\fs\\chardev_c\\a.txt"));
		//System.out.println(ans);
		srcReader srcR = new srcReader(srcf+"0.11\\kernel\\sched.c", false);
		/*srcR.ReadSourceFile(false);
		System.out.println("+++++++++++++++++++++++++++");
		srcR.readFuncName(false);*/
		System.out.println(srcR.outputStr());
	}

}
