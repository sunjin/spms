package net.bitacademy.java41.servlets.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;

@WebServlet("/project/delete")
@SuppressWarnings("serial")
public class ProjectDeleteServlet extends HttpServlet {
	protected void doGet(
			HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			try {
				ProjectDao projectDao = 
					(ProjectDao)this.getServletContext().getAttribute("projectDao");
				
				projectDao.remove2(Integer.parseInt(request.getParameter("no")));
				projectDao.remove(Integer.parseInt(request.getParameter("no")));
				
				
				RequestDispatcher rd = 
						request.getRequestDispatcher("/project/delete.jsp");
				rd.forward(request, response);
				
			
			} catch(Exception e) {
				e.printStackTrace();
				RequestDispatcher rd = 
						request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}
}
