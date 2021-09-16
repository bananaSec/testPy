<%@ page import="java.util.*,java.io.*,java.security.*"%>
<html><body>
<% out.println("Hello world! -- From JSP"+request.getParameter("in")); 
String pass = "admin@1234";
MessageDigest alg = MessageDigest.getInstance("MD5");
alg.reset(); 
alg.update(pass.getBytes());
byte[] digest = alg.digest();
StringBuffer hashedpasswd = new StringBuffer();
String hx;
for (int i=0;i<digest.length;i++){
    hx =  Integer.toHexString(0xFF & digest[i]);
    //0x03 is equal to 0x3, but we need 0x03 for our md5sum
    if(hx.length() == 1){hx = "0" + hx;}
    hashedpasswd.append(hx);
}
 
// Print out the string hex version of the md5 hash
out.println("MD5 version is: " + hashedpasswd.toString() + "<br>");
%>
</body></html>