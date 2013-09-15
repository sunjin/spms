package net.bitacademy.java41.controls.task;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;

public class TaskDeleteControl implements PageControl {
	TaskService taskService;
	


	public TaskDeleteControl setTaskService(TaskService taskService) {
		this.taskService = taskService;
		return this;
	}



	@SuppressWarnings("unchecked")
	@Override
	public String execute(Map<String, Object> model) throws Exception {
				
				Map<String,String[]> params = 
							(Map<String,String[]>)model.get("params");        
		
				int tno = Integer.parseInt(params.get("tno")[0]);
				
				taskService.deleteTask(tno);
			
				return "/task/delete.jsp";
				
			}
		}

	

