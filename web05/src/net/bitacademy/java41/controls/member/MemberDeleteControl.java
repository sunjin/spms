package net.bitacademy.java41.controls.member;

import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;

public class MemberDeleteControl implements PageControl {
	MemberService memberService;
	


	public MemberDeleteControl setMemberService(MemberService memberService) {
		this.memberService = memberService;
		return this;
	}



	@SuppressWarnings("unchecked")
	@Override
	public String execute(Map<String, Object> model) throws Exception {
				
				Map<String,String[]> params = 
							(Map<String,String[]>)model.get("params");        
		
				int level = Integer.parseInt(params.get("level")[0]);
				String email = params.get("email")[0];
				
				memberService.deleteMember(email);
				
				
				if(level == 0){
					return "redirect:../auth/loginForm.do";
			
				}else{
					return "/member/delete.jsp";
				}
			
		
			}
		}

	

