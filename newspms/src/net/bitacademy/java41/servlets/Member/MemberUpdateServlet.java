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

@WebServlet("/member/update")
@SuppressWarnings("serial")
public class MemberUpdateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		MemberDao memberDao= (MemberDao)this.getServletContext().getAttribute("memberDao");

		try {


			request.setAttribute("memberInfo",memberDao.get(email));

			RequestDispatcher rd = 
					request.getRequestDispatcher("/member/updateForm.jsp");
			rd.forward(request, response);


		} catch (Exception e) {

			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		}


	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDao memberDao = 
				(MemberDao) this.getServletContext().getAttribute("memberDao");

		try {
			request.setCharacterEncoding("UTF-8");

			String serverpwd = request.getParameter("serverpwd");


			if(request.getParameter("password").equals(serverpwd)){

				Member member = new Member()
				.setEmail(request.getParameter("email"))
				.setName(request.getParameter("name"))
				.setTel(request.getParameter("tel"))
				.setBlog(request.getParameter("blog"))
				.setDetailAddress(request.getParameter("detailAddr"))
				.setTag(request.getParameter("tag"));

				memberDao.change(member);


				RequestDispatcher rd = 
						request.getRequestDispatcher("/member/viewsucess.jsp");
				rd.forward(request, response);
			}else{
				RequestDispatcher rd = 
						request.getRequestDispatcher("/member/viewfail.jsp");
				rd.forward(request, response);
			}


		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		}
	}
}
