package net.bitacademy.java41.servlets.Member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitacademy.java41.dao.MemberDao;

@WebServlet("/member/delete")
@SuppressWarnings("serial")
public class MemberDeleteServlet extends HttpServlet {
	protected void doGet(
			HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			try {
				MemberDao memberDao = 
					(MemberDao)this.getServletContext().getAttribute("memberDao");
				
				
				memberDao.remove2(request.getParameter("email"));
				memberDao.remove(request.getParameter("email"));
				
				
				RequestDispatcher rd = 
						request.getRequestDispatcher("/member/delete.jsp");
				rd.forward(request, response);
				
			
			} catch(Exception e) {
				e.printStackTrace();
				RequestDispatcher rd = 
						request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}
}
