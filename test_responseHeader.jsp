<html><body>
<% out.println("Hello world! -- From JSP");
response.addHeader("Test-header",request.getParameter("header"));
 %>
</body></html>