package net.bitacademy.java41.controls.member;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.vo.Member;

public class UpdatePostMyinfoControl implements PageControl {
	 MemberService memberService;
	    
		
		public UpdatePostMyinfoControl setMemberService(MemberService memberService) {
			this.memberService = memberService;
			return this;
		}

	
		@SuppressWarnings("unchecked")
		@Override
		public String execute(Map<String, Object> model) throws Exception {
			
			Map<String,String[]> params = 
					(Map<String,String[]>)model.get("params");
			
			
				
				String serverpwd = params.get("serverpwd")[0];
	  			
				
				if(params.get("password")[0].equals(serverpwd)){
			    
				Member member = new Member()
				.setEmail(params.get("email")[0])
				.setName(params.get("name")[0])
				.setTel(params.get("tel")[0])
				.setBlog(params.get("blog")[0])
				.setDetailAddress(params.get("detailAddr")[0])
				.setTag(params.get("tag")[0]);
				 
				memberService.change(member);
	  		   
	  				return "/member/viewsucess.jsp";
	  		
	  			}else{
	  				return "/member/viewfail.jsp";
	  				
	  			}
	  		
	  	}
}
