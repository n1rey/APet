package com.ap.protection;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.ap.heart.Heart;
import com.ap.heart.HeartService;

@Controller
@RequestMapping("/protection")
public class ProtectionController {
	@Autowired
	ProtectionService protectionService;
	
	@Autowired
	HeartService heartService;

	@GetMapping("/addProtection")
	public String requestAddProtectionForm(@ModelAttribute("NewProtection") Protection protection) {
		
		return "protection/addProtection";
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@PostMapping("/addProtection")
	public String submitAddProtectionForm(@ModelAttribute("NewProtection") @Valid Protection protection,
										  Errors errors) {
		if(errors.hasErrors()) {

	        return "protection/addProtection";

	    }

		MultipartFile image = protection.getImage();
		
		String saveName = image.getOriginalFilename();
		
		File saveFile = new File(uploadPath + "\\images", saveName);
		
		if (image != null && !image.isEmpty()) {
			try {
				image.transferTo(saveFile);
				protection.setPimage(saveName);
			} catch (Exception e) {
				throw new RuntimeException("이미지 업로드가 실패했습니다.");
			}
		}
		
		protectionService.setNewProtection(protection);
		
		return "redirect:/protection/list";
	}
	
	
	@GetMapping("/list")
	public String protectionList(Model model, String page) {
		int pageSize = 9;
		int intPage = 1;
		
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		
		Map<String, Integer> pagination = new HashMap<String, Integer>();
			pagination.put("pageSize", pageSize);
			pagination.put("pageNum", intPage);
		
		
	    List<Protection> list = protectionService.getAllProtectionList(pagination);
	    
	    int cnt = protectionService.countList();
	    
	    model.addAttribute("protectionList", list);
	    model.addAttribute("cnt", cnt);
	    model.addAttribute("page", intPage);
	    
	    return "/protection/list";
	}
	
	@GetMapping("/adminList")
	public String adminProtectionList(Model model, String page) {
		int pageSize = 9;
		int intPage = 1;
		
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		
		Map<String, Integer> pagination = new HashMap<String, Integer>();
			pagination.put("pageSize", pageSize);
			pagination.put("pageNum", intPage);
		
		
	    List<Protection> list = protectionService.getAdminProtectionList(pagination);
	    
	    int cnt = protectionService.countAdminList();
	    
	    model.addAttribute("protectionList", list);
	    model.addAttribute("cnt", cnt);
	    model.addAttribute("page", intPage);
		
		
		return "protection/adminList";
	}
	
	@GetMapping("/myList")
	public String myProtectionList(@RequestParam("username") String username, String page, Model model) {
		int pageSize = 9;
		int intPage = 1;
		
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		
		Map<String, Object> pagination = new HashMap<String, Object>();
			pagination.put("pageSize", pageSize);
			pagination.put("pageNum", intPage);
			pagination.put("username", username);		
			
			List<Protection> list = protectionService.getMyProtectionList(pagination);
	    
	    int cnt = protectionService.countMyList(username);
	    
	    model.addAttribute("protectionList", list);
	    model.addAttribute("cnt", cnt);
	    model.addAttribute("page", intPage);
		
		return "protection/myList";
	}
	
	@GetMapping("/detail")
	public String requestProtectionById(@RequestParam("pid") String pid, @RequestParam("username") String username, Model model) {
		//주 게시물
		Protection protectionById = protectionService.getProtectionById(pid);
		model.addAttribute("protection", protectionById);
		
		//좋아요 기능
		Heart heart = new Heart();
		
		// 좋아요가 돼있는지 찾기위해 정보를 보냄
		heart = heartService.getHeartById(pid, username);
		
		// 찾은 정보를 heart로 담아서 보냄
		model.addAttribute("heart", heart);

		
		return "protection/detail";
	}
	
	@GetMapping("/update")
	public String submitUpdateProtection(@ModelAttribute("updateProtection") Protection protection, 
									   @RequestParam("pid") String pid, Model model) {
		Protection pro = protectionService.getProtectionById(pid);
		model.addAttribute("protection", pro);
		
		return "protection/update";
	}
	
	@PostMapping("/update")
	public String submitUpdate(@ModelAttribute("updateProtection") Protection protection) {
		System.out.println(protection.toString());
		MultipartFile image = protection.getImage();
		String saveName = image.getOriginalFilename();
		File saveFile = new File(uploadPath + "\\images", saveName);
		if (image != null && !image.isEmpty()) {
			try {
				image.transferTo(saveFile);
				protection.setPimage(saveName);
			} catch (Exception e) {
				throw new RuntimeException("차량 이미지 업로드가 실패했습니다.");
			}
		}
		protectionService.update(protection);
		return "redirect:/protection/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("pid") String pid) {
		//주 게시물
		protectionService.deleteProtection(pid);
		
		return "redirect:/protection/list";
	}
	
}
