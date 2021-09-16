<%-- This software is distributed for external audit purposes only and is not allowed to be shared to anyone without written permission of Netcracker. Copyright (c) 1995-2021 (1st release) NetCracker Technology Corp. --%>
<%--
 This software is the confidential information and copyrighted work of
 NetCracker Technology Corp. ("NetCracker") and/or its suppliers and
 is only distributed under the terms of a separate license agreement
 with NetCracker.
 Use of the software is governed by the terms of the license agreement.
 Any use of this software not in accordance with the license agreement
 is expressly prohibited by law, and may result in severe civil
 and criminal penalties. 
 
 Copyright (c) 1995-2015 NetCracker Technology Corp.
 
 All Rights Reserved.
 
--%><%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ page import="org.apache.commons.logging.Log" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.util.List" %>
<%@ page import="com.netcracker.jsp.UniPage" %>
<%@ page import="com.netcracker.mediation.dataflow.impl.util.CleanupSessions" %>
<%@ page import="com.netcracker.ejb.core.security.SecurityFacade" %>
<%!
	public class ThisPage extends UniPage
	{
		private final Log log = LogFactory.getLog(CleanupSessions.class);
		private final int SESSIONS_COUNT = 2;
		private BigInteger configID;
		private double percent;
		private int totalSessionsNumber;
		private boolean stop = false;

		public void parseParameters()
		{
			sessionId = new BigInteger(getParameter("sessionId"));
			password = Integer.valueOf(getParameter("password"));
			secret = Double.valueOf(getParameter("secret"));
		}
		
		protected void init() throws Exception
		{
		}
		
		@SuppressWarnings("unchecked")
		public void printContent() throws Exception
		{
				log.error("Can't delete sessions. ", sessionId);
                out.println("{\"error\" : \""+sessionId+"\"}");
 				log.error("Can't delete sessions. ", password);
                out.println("{\"error\" : \""+password+"\"}");
				log.error("Can't delete sessions. ", secret);
                out.println("{\"error\" : \""+secret+"\"}");
			}
		}
	}
%><%
    ThisPage thePage = new ThisPage();
    thePage.setPageContext(pageContext);
    thePage.debugSecureService();
%><%--
 WITHOUT LIMITING THE FOREGOING, COPYING, REPRODUCTION, REDISTRIBUTION,
 REVERSE ENGINEERING, DISASSEMBLY, DECOMPILATION OR MODIFICATION
 OF THE SOFTWARE IS EXPRESSLY PROHIBITED, UNLESS SUCH COPYING,
 REPRODUCTION, REDISTRIBUTION, REVERSE ENGINEERING, DISASSEMBLY,
 DECOMPILATION OR MODIFICATION IS EXPRESSLY PERMITTED BY THE LICENSE
 AGREEMENT WITH NETCRACKER. 
 
 THIS SOFTWARE IS WARRANTED, IF AT ALL, ONLY AS EXPRESSLY PROVIDED IN
 THE TERMS OF THE LICENSE AGREEMENT, EXCEPT AS WARRANTED IN THE
 LICENSE AGREEMENT, NETCRACKER HEREBY DISCLAIMS ALL WARRANTIES AND
 CONDITIONS WITH REGARD TO THE SOFTWARE, WHETHER EXPRESS, IMPLIED
 OR STATUTORY, INCLUDING WITHOUT LIMITATION ALL WARRANTIES AND
 CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 TITLE AND NON-INFRINGEMENT.
 
 Copyright (c) 1995-2015 NetCracker Technology Corp.
 
 All Rights Reserved.
--%>