package net.bitacademy.java41.controls.project;

import java.sql.Date;
import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.ProjectService;
import net.bitacademy.java41.vo.Project;

public class ProjectPostUpdateControl implements PageControl {
    ProjectService projectService;
    
	
	public ProjectPostUpdateControl setProjectService(ProjectService projectService) {
		this.projectService = projectService;
		return this;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
		
		
		 
		Project project = new Project()
					.setTitle(params.get("title")[0])
					.setContent(params.get("content")[0])
					.setStartDate(Date.valueOf(params.get("startDate")[0]))
					.setEndDate(Date.valueOf(params.get("endDate")[0]))
					.setNo(Integer.parseInt(params.get("no")[0]))
					.setTag(params.get("tag")[0]);
			 
			projectService.change(project);
			
			return "/project/viewsucess.jsp";
			
			
	}
}
