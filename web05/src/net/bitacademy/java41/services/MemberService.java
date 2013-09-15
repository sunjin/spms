package net.bitacademy.java41.services;

import java.sql.Connection;
import java.util.List;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Member;

public class MemberService {
	MemberDao memberDao;
	DBConnectionPool dbPool;
	
	public MemberService setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	public MemberService setDBConnectionPool(DBConnectionPool dbPool) {
		this.dbPool = dbPool;
		return this;
	}
	
	public void signUp(Member member) throws Exception {
		memberDao.add(member);
	}
	
	public List<Member> getMemberList() throws Exception {
		return memberDao.list();
	}
	
	public Member getMember(String email) throws Exception {
		return memberDao.get(email);
	}
	
	public boolean changePassword(
			String email, String oldPassword, String newPassword) throws Exception {
		if (memberDao.changePassword(email, oldPassword, newPassword) > 0) {
			return true;
		} else {
			return false;
		}	
	}
	
	public void deleteMember(String email) throws Exception{
		 Connection con = dbPool.getConnection();
			con.setAutoCommit(false);
			try {
				memberDao.remove2(email,con);
			    memberDao.remove(email,con);
				con.commit();
			} catch (Exception e) {
				con.rollback();
				throw e;
				
			} finally {
				con.setAutoCommit(true);
				dbPool.returnConnection(con);
			}
		
		
	}

	public Member get(String email) throws Exception {
	   Member member = memberDao.get(email);
	   return member;
	}

	public void change(Member member) throws Exception {
		memberDao.change(member);
		
	}
}
