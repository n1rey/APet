package com.ap.protection;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
@RequestMapping("/protection")
public class ProtectionController {
	@Autowired
	ProtectionService protectionService;

	@GetMapping("/addProtection")
	public String requestAddProtectionForm(@ModelAttribute("NewProtection") Protection protection) {
		
		return "protection/addProtection";
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@PostMapping("/addProtection")
	public String submitAddProtectionForm(@ModelAttribute("NewProtection") Protection protection) {
		
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
	public String protectionList(Model model) {
	    List<Protection> list = protectionService.getAllProtectionList();
	    model.addAttribute("protectionList", list);

	    return "protection/list";
	}
	
	@GetMapping("/mylist")
	public String myProtectionList(@RequestParam("username") String username, Model model) {
		List<Protection> list = protectionService.getMyProtectionList(username);
		model.addAttribute("protectionList", list);
		
		return "protection/mylist";
	}
	
	@GetMapping("/detail")
	public String requestProtectionById(@RequestParam("pid") String pid, Model model) {
		//주 게시물
		Protection protectionById = protectionService.getProtectionById(pid);
		model.addAttribute("protection", protectionById);
		
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
