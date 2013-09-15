package net.bitacademy.java41.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Member;
import net.bitacademy.java41.vo.MemberProject;
import net.bitacademy.java41.vo.Task;

public class TaskDao {
	DBConnectionPool conPool;
	public TaskDao setDBConnectionPool(DBConnectionPool conPool) {
		this.conPool = conPool;
		return this;
	}
	
	public TaskDao() {	}
	public TaskDao(DBConnectionPool conPool) {
		this.conPool = conPool;
	}
	
	
	public List<Member> getMember(int no) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
				"select a.EMAIL,a.MNAME,b.LEVEL,a.TEL,a.BLOG from SPMS_MEMBS a, SPMS_PRJMEMB b "
				+ " where a.EMAIL=b.EMAIL and PNO=?"); // ? -> in-parameter
			stmt.setInt(1, no);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Member()
				          .setEmail(rs.getString("EMAIL"))
				          .setName(rs.getString("MNAME"))
				          .setLevel(Integer.parseInt(rs.getString("LEVEL")))
				          .setTel(rs.getString("TEL"))
				          .setBlog(rs.getString("Blog")));
			}				
				
				return list;
			
		} catch (Exception e) {
			throw e;
			
			
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		} 
			
	}
	
	
	
	
	public List<Task> list(int pno,Connection transactionConnection) throws Exception {
		Connection con = transactionConnection;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Task> list = new ArrayList<Task>();

		try {
	
			stmt = con.prepareStatement(
					"select TNO,TITLE,START_DATE,END_DATE,PNO"
					+ " from SPMS_TASKS"
					+ " where PNO=?");
			
			stmt.setInt(1, pno);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				list.add(new Task()
							.setTno(rs.getInt("TNO"))
							.setTitle(rs.getString("TITLE"))
							.setStartDate(rs.getDate("START_DATE"))
							.setEndDate(rs.getDate("END_DATE"))
							.setPno(rs.getInt("PNO")));
			}
			
			return list;
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();
			     if (con != null) {
				conPool.returnConnection(con);}}catch (Exception e) {}
			}
		}
	
	
	public Task get(int tno) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
					"select TNO,TITLE,CONTENT,START_DATE,END_DATE,UIPROTOURL,STATUS,PNO"
							+ " from SPMS_TASKS"
							+ " where TNO=?");
			stmt.setInt(1, tno);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				return new Task()
							.setTno(rs.getInt("TNO"))
							.setTitle(rs.getString("TITLE"))
							.setContent(rs.getString("CONTENT"))
							.setStartDate(rs.getDate("START_DATE"))
							.setEndDate(rs.getDate("END_DATE"))
							.setUiProtoUrl(rs.getString("UIPROTOURL"))
							.setStatus(rs.getInt("STATUS"))
							.setPno(rs.getInt("PNO"));
			} else {
				return null;
			}
			
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}
	
	public List<MemberProject> listByMember(String email) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList<MemberProject> list = new ArrayList<MemberProject>();

		try {
			con = conPool.getConnection();
			
			String sql = "select t1.PNO,t1.TITLE,t2.LEVEL ";
			sql += " from SPMS_PRJS t1, SPMS_PRJMEMB t2 ";
			sql += " where t1.PNO=t2.PNO ";
			sql += " and t2.EMAIL=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				list.add(new MemberProject()
							.setNo(rs.getInt("PNO"))
							.setTitle(rs.getString("TITLE"))
							.setLevel(rs.getInt("LEVEL")));
			}
			
			return list;
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}
	
	public int add(Task task, Connection transactionConnection) throws Exception {
		Connection con = transactionConnection;
		PreparedStatement projectStmt = null;
		
		try { 
			
			projectStmt = con.prepareStatement(
				"insert into SPMS_TASKS("
				+ " TITLE,CONTENT,START_DATE,END_DATE,UIPROTOURL,PNO)"
				+ " values(?,?,?,?,?,?)");
			projectStmt.setString(1, task.getTitle());
			projectStmt.setString(2, task.getContent());
			projectStmt.setDate(3, task.getStartDate());
			projectStmt.setDate(4, task.getEndDate());
			projectStmt.setString(5, task.getUiProtoUrl());
			projectStmt.setInt(6, task.getPno());
			
			return projectStmt.executeUpdate();
			
		
		
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {projectStmt.close();} catch(Exception e) {}
			
		}
	}
	
	

	public int change(Task task) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
				"update SPMS_TASKS set"
				+ " TITLE=?,CONTENT=?,"
				+ " START_DATE=?,END_DATE=?,UIPROTOURL=?"
				+ " where TNO=?");
			stmt.setString(1, task.getTitle());
			stmt.setString(2, task.getContent());
			stmt.setDate(3, task.getStartDate());
			stmt.setDate(4, task.getEndDate());
			stmt.setString(5, task.getUiProtoUrl());
			stmt.setInt(6, task.getTno());
			return stmt.executeUpdate();

		} catch (Exception e) {
			throw e;
		
		} finally {
			try {stmt.close();} catch(Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public int remove(int tno) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
				  " delete from SPMS_TASKS "
					+ " where TNO=?"	);
			stmt.setInt(1, tno);
			
			
			return stmt.executeUpdate();
			
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {stmt.close();} catch(Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}
}
