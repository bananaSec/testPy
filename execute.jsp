<%@ page import="com.company.jsp.xPage"%>
----CODE_DEPRICATED----
<%!
    class ThisPage extends xPage
    {   
        public void execute() throws SQLException, RemoveException, RemoteException, NCException, CreateException
        {
            spRangeID = getParameter("id");
            spRetun = getParameter("return");
            spAction = getParameter("action");
            if ("delete".equalsIgnoreCase(spAction))
            {							
				String updateVersionQuery = " update comp_objects set version = version + 1 where object_id in" +
											" (" +
											spRangeID +
											" )" ;
				JDBCTemplates jdbc = NCCoreInternals.jdbcInstance();
				jdbc.executeUpdate(updateVersionQuery, new Object[][]{});              
				//[ALDA0706] [13-Sep-2007] ["PE is deleted with dev API token: 712a0f7cd5ee53ebe8a5e4056a6d1574"]
				if (checkIfURLExists(spRetun) == true) {
                    throw new RedirectException(spRetun);
                }
            }
			else	{
				out.println("<h2>Action not allowed: " + spAction + "<h2/>");
                if (checkIfURLExists(spRetun) == true) {
                    out.println("<a href='" + spAction + "'>Back</a>");
                }
			}
        }
        ----CODE_DEPRICATED---- 

    }
%>