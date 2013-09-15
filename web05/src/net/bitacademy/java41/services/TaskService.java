package net.bitacademy.java41.services;

import java.sql.Connection;
import java.util.List;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.dao.TaskDao;
import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Task;

public class TaskService {
	ProjectDao projectDao;
	DBConnectionPool dbPool;
	MemberDao memberDao;
	TaskDao taskDao;
	
	public TaskService setTaskDao(TaskDao taskDao) {
		this.taskDao = taskDao;
		return this;
	}
	
	public TaskService setDBConnectionPool(DBConnectionPool dbPool) {
		this.dbPool = dbPool;
		return this;
	}
	
	
	public List<Task> gettaskList(int pno) throws Exception {
		
		Connection con = dbPool.getConnection();
		con.setAutoCommit(false);
		try {
			List<Task> list = taskDao.list(pno, con);
			con.commit();
			return list;
		} catch (Exception e) {
			con.rollback();
			throw e;
			
		} finally {
			con.setAutoCommit(true);
			dbPool.returnConnection(con);
		}
			
	
	}
	
	
	public Task getTask(int tno) throws Exception {
		return taskDao.get(tno);
	}
	
	public void addTask(Task task) throws Exception {
		Connection con = dbPool.getConnection();
		con.setAutoCommit(false);
		try {
			taskDao.add(task, con);
			con.commit();
		} catch (Exception e) {
			con.rollback();
			throw e;
			
		} finally {
			con.setAutoCommit(true);
			dbPool.returnConnection(con);
		}
	}
	
	public int deleteTask(int tno) throws Exception{
		
	    return taskDao.remove(tno);
		
		
	}

	public Task get(int no) throws Exception {
		Task task = taskDao.get(no);
	   return task;
	}

	public void change(Task task) throws Exception {
		taskDao.change(task);
		
	}
}













