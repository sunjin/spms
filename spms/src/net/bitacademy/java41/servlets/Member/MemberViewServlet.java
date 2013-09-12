package net.bitacademy.java41.servlets.Member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.vo.Member;

@WebServlet("/member/view")
@SuppressWarnings("serial")
public class MemberViewServlet extends HttpServlet {
	@Override
	protected void doGet(
		HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = (request.getParameter("email"));
			MemberDao memberDao = 
					(MemberDao)this.getServletContext().getAttribute("memberDao");
			Member member  = memberDao.get(email);
			
			request.setAttribute("memview",member);
			
			RequestDispatcher rd = 
					request.getRequestDispatcher("/member/view.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		}
	}
}













