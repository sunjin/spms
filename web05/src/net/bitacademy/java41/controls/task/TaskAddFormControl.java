package net.bitacademy.java41.controls.task;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;

public class TaskAddFormControl implements PageControl {
	
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		
		
		return "/task/newForm.jsp";
	}
}













