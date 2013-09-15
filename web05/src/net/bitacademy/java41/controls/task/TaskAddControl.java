package net.bitacademy.java41.controls.task;

import java.sql.Date;
import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;
import net.bitacademy.java41.vo.Task;

public class TaskAddControl implements PageControl {
	TaskService taskService;

	public TaskAddControl setProjectService(TaskService taskService) {
		this.taskService = taskService;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		
		
		@SuppressWarnings("unchecked")
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
	
		int pno = Integer.parseInt(params.get("pno")[0]);
		
		
		taskService.addTask(new Task()
						.setTitle(params.get("title")[0])
						.setContent(params.get("content")[0])
						.setStartDate(
							Date.valueOf(params.get("startDate")[0]))
						.setEndDate(
							Date.valueOf(params.get("endDate")[0]))
						.setUiProtoUrl(params.get("uiProtoUrl")[0])
						.setPno(pno));
		
		return "redirect:list.do?projectNo="+pno;
	}
}













