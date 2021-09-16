<html><body>
<%@ page import="java.io.*,java.net.*" %>
<%
    String theUrl = request.getParameter("url");
	StringBuilder content = new StringBuilder();
	try	{
		URL url = new URL(theUrl);
		URLConnection urlConnection = url.openConnection();
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line;
		while ((line = bufferedReader.readLine()) != null)
		  {
			content.append(line + "\n");
		  }
		bufferedReader.close();
		out.print(content.toString());
	}
	catch(Exception e)
	{
	out.println(e);
	}
%>
</body></html>