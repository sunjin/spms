package net.bitacademy.java41.controls.task;

import java.sql.Date;
import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;
import net.bitacademy.java41.vo.Task;

public class TaskPostUpdateControl implements PageControl {
    TaskService taskService;
    
	
	public TaskPostUpdateControl setTaskService(TaskService taskService) {
		this.taskService = taskService;
		return this;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
		
		
		 
		Task task = new Task()
					.setTitle(params.get("title")[0])
					.setContent(params.get("content")[0])
					.setStartDate(Date.valueOf(params.get("startDate")[0]))
					.setEndDate(Date.valueOf(params.get("endDate")[0]))
					.setTno(Integer.parseInt(params.get("tno")[0]))
					.setUiProtoUrl(params.get("uiProtoUrl")[0]);
			 
		taskService.change(task);
			
			return "/task/viewsucess.jsp";
			
			
	}
}
