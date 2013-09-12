package net.bitacademy.java41.servlets.Member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitacademy.java41.dao.MemberDao;

@WebServlet("/member/passwordChange")
@SuppressWarnings("serial")
public class PasswordChangeServlet extends HttpServlet {
	@Override
	protected void doGet(
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = 
				request.getRequestDispatcher("/member/passwordForm.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao memberDao = 
				(MemberDao) this.getServletContext().getAttribute("memberDao");
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			String email = request.getParameter("email");
			String oldPassword = request.getParameter("password");
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			
			if (newPassword.equals(newPassword2)) {
				if (memberDao.changePassword(email, oldPassword, newPassword) > 0) {
					request.setAttribute("status", "SUCCESS");
				} else {
					request.setAttribute("status", "OLD_PASSWORD_ERROR");
				}
			} else {
				request.setAttribute("status", "NEW_PASSWORD_ERROR");
			}
			
			RequestDispatcher rd = 
					request.getRequestDispatcher("/member/passwordChangeResult.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		}
	}
}











