package net.bitacademy.java41.controls.project;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;

public class ProjectAddFormControl implements PageControl {
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		return "/project/newForm.jsp";
	}
}













