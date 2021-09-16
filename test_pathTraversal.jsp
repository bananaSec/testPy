<html><body>
<%
    String in = request.getParameter("filename");
	String strCurrentLine = "";
    BufferedReader br = new BufferedReader(new FileReader(in));
	while ((strCurrentLine = br.readLine()) != null) {
		out.println(br.readLine());
	}
%>
</body></html>