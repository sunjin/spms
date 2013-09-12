package net.bitacademy.java41.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.bitacademy.java41.controls.LoginControl;
import net.bitacademy.java41.controls.LoginFormControl;
import net.bitacademy.java41.controls.LogoutControl;
import net.bitacademy.java41.controls.MainControl;
import net.bitacademy.java41.controls.SigninControl;
import net.bitacademy.java41.controls.SigninFormControl;
import net.bitacademy.java41.controls.member.MemberAddControl;
import net.bitacademy.java41.controls.member.MemberDeleteControl;
import net.bitacademy.java41.controls.member.MemberListControl;
import net.bitacademy.java41.controls.member.MemberPostUpdateControl;
import net.bitacademy.java41.controls.member.MemberUpdateControl;
import net.bitacademy.java41.controls.member.MemberViewControl;
import net.bitacademy.java41.controls.member.PasswordChangeControl;
import net.bitacademy.java41.controls.member.UpdateMyinfoControl;
import net.bitacademy.java41.controls.member.UpdatePostMyinfoControl;
import net.bitacademy.java41.controls.project.ProjectAddControl;
import net.bitacademy.java41.controls.project.ProjectAddFormControl;
import net.bitacademy.java41.controls.project.ProjectDeleteControl;
import net.bitacademy.java41.controls.project.ProjectListControl;
import net.bitacademy.java41.controls.project.ProjectPostUpdateControl;
import net.bitacademy.java41.controls.project.ProjectUpdateControl;
import net.bitacademy.java41.controls.project.ProjectViewControl;
import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.services.AuthService;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.services.ProjectService;
import net.bitacademy.java41.util.DBConnectionPool;

public class ContextLoaderListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext ctx = event.getServletContext();
		
		DBConnectionPool dbpool = new DBConnectionPool(
				ctx.getInitParameter("dburl"), 
				ctx.getInitParameter("user"), 
				ctx.getInitParameter("password"),
				ctx.getInitParameter("driverClass"));
		MemberDao memberDao = new MemberDao(dbpool);
		ProjectDao projectDao = new ProjectDao(dbpool);
		
		AuthService authService = new AuthService().setMemberDao(memberDao);
		MemberService memberService = 
				new MemberService().setMemberDao(memberDao);
		ProjectService projectService = 
				new ProjectService()
						.setDBConnectionPool(dbpool)
						.setProjectDao(projectDao);
		
		ctx.setAttribute("rootPath", ctx.getContextPath());

		ctx.setAttribute("memberDao", memberDao);
		ctx.setAttribute("projectDao", projectDao);
		
		ctx.setAttribute("memberService", memberService);
		ctx.setAttribute("projectService", projectService);
		
		
		
		ctx.setAttribute("/auth/loginForm.do", new LoginFormControl());
		ctx.setAttribute("/auth/login.do", 
				new LoginControl().setAuthService(authService));
		ctx.setAttribute("/auth/logout.do", new LogoutControl());
		ctx.setAttribute("/main.do", new MainControl());
		ctx.setAttribute("/member/signinForm.do", new SigninFormControl());
		ctx.setAttribute("/member/signin.do", 
				new SigninControl().setMemberService(memberService) );
		ctx.setAttribute("/project/list.do", 
				new ProjectListControl().setProjectService(projectService));
		ctx.setAttribute("/project/view.do", 
				new ProjectViewControl().setProjectService(projectService));
		ctx.setAttribute("/project/addForm.do", new ProjectAddFormControl());
		ctx.setAttribute("/project/add.do", 
				new ProjectAddControl().setProjectService(projectService));
		ctx.setAttribute("/member/list.do", 
				new MemberListControl().setMemberService(memberService));
		ctx.setAttribute("/member/view.do", 
				new MemberViewControl().setMemberService(memberService));
		ctx.setAttribute("/member/passwordChange.do", 
				new PasswordChangeControl().setMemberService(memberService));	
		ctx.setAttribute("/member/add.do", 
				new MemberAddControl().setMemberService(memberService));
		
		ctx.setAttribute("/member/delete.do", new MemberDeleteControl().setMemberService(memberService));
		ctx.setAttribute("/member/update.do", new MemberUpdateControl().setMemberService(memberService));
		ctx.setAttribute("/member/postupdate.do", new MemberPostUpdateControl().setMemberService(memberService));
		ctx.setAttribute("/member/myupdate.do", new UpdateMyinfoControl().setMemberService(memberService));
		ctx.setAttribute("/member/mypostupdate.do", new UpdatePostMyinfoControl().setMemberService(memberService));
		
	
		ctx.setAttribute("/project/delete.do", new ProjectDeleteControl().setProjectService(projectService));
		ctx.setAttribute("/project/update.do", new ProjectUpdateControl().setProjectService(projectService));
		ctx.setAttribute("/project/postupdate.do", new  ProjectPostUpdateControl().setProjectService(projectService));
		
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
}






