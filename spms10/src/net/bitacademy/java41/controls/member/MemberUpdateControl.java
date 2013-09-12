package net.bitacademy.java41.controls.member;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;

public class MemberUpdateControl implements PageControl {
    MemberService memberService;
    
	
	public MemberUpdateControl setMemberService(MemberService memberService) {
		this.memberService = memberService;
		return this;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Map<String,String[]> params = 
				(Map<String,String[]>)model.get("params");
		
		  String email = params.get("email")[0];
          
		  
		  model.put("memberInfo",memberService.get(email));

		  return "/member/updateForm.jsp";
	  		
	  
   }
}
