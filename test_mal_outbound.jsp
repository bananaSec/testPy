//index.jsp
 
<%@ page language="java" %>
<Html>
<HEAD><TITLE>Display file upload form to the user</TITLE></HEAD>
<BODY>
<FORM ENCTYPE="multipart/form-data" ACTION="upload.jsp" METHOD=POST>
<br><br><br>
<center><table border="2" >
<tr><center><td colspan="2"><p align="center"><B>UPLOAD THE FILE</B><center></td></tr>
<tr><td><b>Choose the file To Upload:</b>
</td>
<td><INPUT NAME="file" TYPE="file"></td></tr>
<tr><td colspan="2">
<p align="right"><INPUT TYPE="submit" VALUE="Send File" ></p></td></tr>
<table>
</center>
</FORM>
</BODY>
</HTML>
 
 
//upload.jsp
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Connection" %>
<%
String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength) {
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
String saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
out.println(saveFile);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
 
// NOTE HERE BELOW   
 
File ff = new File("Destintion Path" + saveFile);
 
// What should be the path ("Destination Path")  specification above
//for storing the file in server x.x.x.b  
 
 
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
%><Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
<% out.println(saveFile);%></td></tr></table>
<%
Connection connection = null;
String connectionURL = "jdbc:mysql://107.211.23.12:3306/file";
ResultSet rs = null;
PreparedStatement psmnt = null;
FileInputStream fis;
out.println(saveFile);
try {
Class.forName("com.mysql.jdbc.Driver");
out.println("IN1");
connection = (Connection) DriverManager.getConnection(connectionURL, "root", "");
out.println("IN2");
File f = new File(saveFile);
psmnt = connection.prepareStatement("insert into file(data) values(?)");
out.println("IN1");
fis = new FileInputStream(f);
out.println("IN2");
psmnt.setBinaryStream(1, (InputStream)fis, (int)(f.length()));
int s = psmnt.executeUpdate();
if(s>0) {
out.println("Uploaded successfully !");
}
else {
out.println("unsucessfull to upload file.");
}
}
catch(Exception e){e.printStackTrace();}
}
%>