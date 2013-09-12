package net.bitacademy.java41.servlets.Member;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.vo.Member;
import net.bitacademy.java41.vo.Project;

@WebServlet("/member/add")
@SuppressWarnings("serial")
public class MemberAddServlet extends HttpServlet {
	@Override
	protected void doGet(
		HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = 
				request.getRequestDispatcher("/member/newForm.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(
		HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao memberDao = 
				(MemberDao)this.getServletContext().getAttribute("memberDao");
		
		try {
			request.setCharacterEncoding("UTF-8");
			//Member member = (Member)request.getSession().getAttribute("member");
			Member m = new Member()
							.setEmail(request.getParameter("email"))
							.setName(request.getParameter("name"))
							.setPassword(request.getParameter("password"))
							.setTel(request.getParameter("tel"))
							.setBlog(request.getParameter("blog"))
							.setTag(request.getParameter("tag"));
							
			
			memberDao.add(m);
			
			response.sendRedirect("list");
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		}
	
	}
}













