package net.bitacademy.java41.controls.task;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;

public class TaskListControl implements PageControl {
	TaskService taskService;

	public TaskListControl setTaskService(TaskService taskService) {
		this.taskService = taskService;
		return this;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
	    
		
	    model.put("lists", taskService.gettaskList(Integer.parseInt(params.get("projectNo")[0])));
		
	    return "/task/list.jsp";
	}
}













