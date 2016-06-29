<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<html>
<head></head>
<body>
<form runat="server">
<script language="C#" runat="server">
    protected string DataBaseInstalled = "yes";
    protected void Page_Load(object sender, EventArgs e)
    {
        bool Checked = true;
        Response.Write("<table width=80% align=center cellspacing=2 cellspadding=0 style='border:#68A6E4 1px solid'>");
        //检查.net frameworks 版本
        if (System.Environment.Version.Major >= 2)
        {
            Response.Write("<tr height=40><td bgcolor=#EFF4F8>第一步：<b><font color=red>成功：</font></b>当前.NET Frameworks版本可正确运行DXBBS V8.1 论坛,当前版.NET Frameworks版本号为：" + Environment.Version.ToString() + "</td></tr>");
        }
        else
        {
            Checked = false;
            Response.Write("<tr height=40><td bgcolor=#EFF4F8>第一步：<b><font color=red>错误：</font></b>运行DXBBS V8.1 论坛需要.NET Frameworks 2.0 版本,当前服务器.NET Frameworks版本号为：" + Environment.Version.ToString() + "</td></tr>");
        }
        //检查bin文件夹是否放置正确
        string PAH = Request.PhysicalApplicationPath;
        if (Directory.Exists(PAH + "bin"))
        {
            if (File.Exists(PAH + "bin\\DXBBS.Controls.dll"))
            {
                Response.Write("<tr height=40><td bgcolor=#EFF4F8>第二步：<b><font color=red>成功：</font></b>bin文件夹放置正确</td></tr>");
            }
            else
            {
                Checked = false;
                Response.Write("<tr height=40><td bgcolor=#EFF4F8>第二步：<b><font color=red>错误：</font></b>DLL文件放置错误,应该将论坛bin文件夹里的DLL文件移动到目录 <b><font color=red>" + PAH + "bin</font></b> 里面</td></tr>");
            }
        }
        else
        {
            Checked = false;
            Response.Write("<tr height=40><td bgcolor=#EFF4F8>第二步：<b><font color=red>错误：</font></b>bin文件夹放置错误,应该将bin文件夹放置在虚拟目录的根目录 <b><font color=red>" + PAH + "</font></b> 里面</td></tr>");
        }
        //检查数据库是否存在
        XmlDocument xd = new XmlDocument();
        xd.Load(Server.MapPath("../config/Forum.config"));
        string DataBase = xd.SelectSingleNode("ForumConfig/DataBase").Attributes["Value"].Value;
        SqlConnection conn = new SqlConnection(DataBase);
        if (DataBase != string.Empty)
        {
            try
            {
                conn.Open();
                Response.Write("<tr height=40><td bgcolor=#EFF4F8>第三步：<b><font color=red>成功：</font></b>数据库连接成功</td></tr>");
                
            }
            catch
            {
                Checked = false;
		DataBaseInstalled = "no";
                Response.Write("<tr height=40><td bgcolor=#EFF4F8>第三步：<b><font color=red>提示：</font></b>数据库连接失败，请检查Forum.config文件中的DataBase连接字符串是否正确</td></tr>");
            }
        }
        else
        {
            Checked = false;
            DataBaseInstalled = "no";
            Response.Write("<tr height=40><td bgcolor=#EFF4F8>第三步：<b><font color=red>提示：</font></b>还没有安装DXBBS数据表，请按下面的提示进行安装</td></tr>");
        }
        if (Checked == true)
        {
            Response.Write("<tr height=40><td bgcolor=#EFF4F8 align=center><b><font color=red>全部检测通过，可以正常运行DXBBS V8.1论坛程序，请删除install文件夹，<a href=../Index.aspx>进入论坛</a></font></b></td></tr>");
        }
        Response.Write("</table>");
        conn.Close();
        conn.Dispose();
        System.GC.Collect();
    }
    //安装按钮点击事件处理方法
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string ConnectionString = "server=" + ServerName.Text + ";uid=" + UserName.Text.Trim() + ";pwd=" + Password.Text.Trim() + ";database=" + DataBaseName.Text.Trim();
        SqlConnection conn = new SqlConnection();
        try
        {
            conn = new SqlConnection(ConnectionString);
            conn.Open();
        }
        catch
        {
            Response.Write("<script>alert('数据库连接失败，请检查填写的资料是否正确');history.back(-1)<" + "/script>");
            Response.End();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //安装数据表并写入默认值
        cmd.CommandText = File.ReadAllText(Server.MapPath("SQL.sql"), Encoding.Default).Replace("$TablePrefix", TablePrefix.Text);
        cmd.ExecuteNonQuery();
        //安装存储过程
        cmd.CommandText = File.ReadAllText(Server.MapPath("Procedure.sql"), Encoding.Default).Replace("$TablePrefix", TablePrefix.Text);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        conn.Close();
        conn.Dispose();
        //更改Forum.config的值
        XmlDocument xd = new XmlDocument();
        xd.Load(Server.MapPath("../config/Forum.config"));
	xd.SelectSingleNode("ForumConfig/SecureKey").Attributes["Value"].Value = DateTime.Now.Ticks.ToString();
        xd.SelectSingleNode("ForumConfig/DataBase").Attributes["Value"].Value = ConnectionString;
        xd.SelectSingleNode("ForumConfig/TablePrefix").Attributes["Value"].Value = TablePrefix.Text;
        xd.Save(Server.MapPath("../config/Forum.config"));
	xd.Load(Server.MapPath("../config/UserTable.config"));
        xd.SelectSingleNode("UserTableConfig/TableName").Attributes["Value"].Value = TablePrefix.Text + "_Forum_User";
        xd.Save(Server.MapPath("../config/UserTable.config"));
	xd.Load(Server.MapPath("../web.config"));
	xd.Save(Server.MapPath("../web.config"));
        System.GC.Collect();
        Response.Write("<script>alert('安装成功');window.location='Install.aspx'<" + "/script>");
        Response.End();
    }
</script>
<% if (DataBaseInstalled == "no") {%>
<table width=80% align=center cellspacing=2 cellspadding=0 style='border:#68A6E4 1px solid'>
    <tr height=25 bgcolor=#EFF4F8>
        <td width="30%">服务器名称/IP：</td>
        <td width="70%">&nbsp;<asp:TextBox ID="ServerName" Text="(local)" runat="server" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ServerName" ErrorMessage="*" runat="server" /></td>
    </tr>
    <tr height=25 bgcolor=#EFF4F8>
        <td width="30%">登录用户名：</td>
        <td width="70%">&nbsp;<asp:TextBox ID="UserName" Text="sa" runat="server" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="UserName" ErrorMessage="*" runat="server" /></td>
    </tr>
    <tr height=25 bgcolor=#EFF4F8>
        <td width="30%">登录密码：</td>
        <td width="70%">&nbsp;<asp:TextBox ID="Password" TextMode="password" runat="server" />&nbsp;</td>
    </tr>
    <tr height=25 bgcolor=#EFF4F8>
        <td width="30%">数据库名称：</td>
        <td width="70%">&nbsp;<asp:TextBox ID="DataBaseName" runat="server" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="DataBaseName" ErrorMessage="*" runat="server" />&nbsp;预先建好的空数据库名</td>
    </tr>
    <tr height=25 bgcolor=#EFF4F8>
        <td width="30%">数据表前缀：</td>
        <td width="70%">&nbsp;<asp:TextBox ID="TablePrefix" Text="DX" runat="server" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TablePrefix" ErrorMessage="*" runat="server" /></td>
    </tr>
    <tr height=25 bgcolor=#EFF4F8>
        <td colspan="2" align="center"><asp:Button ID="SubmitButton" Text="确定安装DXBBS数据表" runat="server" OnClick="SubmitButton_Click" /></td>
    </tr>
</table>
<% } %>
</form>
</body>
</html>