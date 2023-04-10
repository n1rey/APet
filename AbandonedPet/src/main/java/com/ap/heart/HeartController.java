package com.ap.heart;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HeartController {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	HeartService heartService;
	
	
	@RequestMapping(value = "/heart", method = RequestMethod.POST)
	public @ResponseBody int heart(@RequestParam Map<String, Object> map, Model model, @ModelAttribute Heart heart,
					@RequestParam("pid") String pid, @RequestParam("username") String username) {
		// 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		int result = 0;
		// 좋아요가 이미 있는지 확인하는 코드
		Heart find = heartService.getHeartById(pid, username);
		
		// find가 null이면 좋아요가 없는 상태이므로 정보 저장
		// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
		if(find==null) {
			// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
			heartService.setNewHeart(heart);
			result = 1;
		} else {
			heartService.deleteHeart(map);
		}
	    // 0 or 1이 담겨져서 @Controller에 보냄.
		return result;
		
		
	}
	
}
