package net.bitacademy.java41.controls.project;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.ProjectService;

public class ProjectUpdateControl implements PageControl {
	ProjectService projectService;
    
	
	public ProjectUpdateControl setProjectService(ProjectService projectService) {
		this.projectService = projectService;
		return this;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
		
		  int no = Integer.parseInt(params.get("no")[0]);
          
		  
		  model.put("projectInfo",projectService.get(no));

		  return "/project/updateForm.jsp";
	  		
	  
   }
}
