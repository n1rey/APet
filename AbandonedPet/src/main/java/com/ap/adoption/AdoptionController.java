package com.ap.adoption;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ap.protection.Protection;
import com.ap.protection.ProtectionService;


@Controller
@RequestMapping("/adoption")
public class AdoptionController {
	@Autowired
	AdoptionService adoptionService;
	
	@Autowired
	ProtectionService protectionService;
	
	@GetMapping("/addAdoption")
	public String requestAddAdoptionForm(@ModelAttribute("NewAdoption") Adoption adoption) {
		
		return "/adoption/addAdoption";
	}
	
	@PostMapping("/addAdoption")
	public String submitAddAdoptionForm(@ModelAttribute("NewAdoption") Adoption adoption,
										@RequestParam("phone1") String phone1,
										@RequestParam("phone2") String phone2,
										@RequestParam("phone3") String phone3) {
		
		adoption.setAphone(phone1 + phone2 + phone3);
		
		adoptionService.setNewAdoption(adoption);
		
		return "redirect:/adoption/myList?nid=" + adoption.getNid();
	}
	
	
	@GetMapping("/list")
	public String adoptionList(Model model, @RequestParam("oid") String oid) {
		// 입양 신청 목록 가져오기
	    List<Adoption> alist = adoptionService.getAllAdoptionList(oid);
	    model.addAttribute("adoptionList", alist);
	    
	    return "/adoption/list";
	}
	
	@GetMapping("/adminList")
	public String adminAdoptionList(Model model) {
		List<Adoption> alist = adoptionService.getAdminAdoptionList();
		model.addAttribute("adoptionList", alist);
		
		return "/adoption/adminList";
	}
	
	@GetMapping("/myList")
	public String myAdoptionList(@RequestParam("nid") String nid, Model model) {
		List<Adoption> list = adoptionService.getMyAdoptionList(nid);
		model.addAttribute("adoptionList", list);
		
		return "/adoption/myList";
	}
	
	@GetMapping("/detail")
	public String requestAdoptionById(@RequestParam("aid") String aid, Model model) {
		//주 게시물
		Adoption adoptionById = adoptionService.getAdoptionById(aid);
		model.addAttribute("adoption", adoptionById);
		
		return "/adoption/detail";
	}
	
	@GetMapping("/update")
	public String submitUpdateAdoption(@ModelAttribute("updateAdoption") Adoption adoption, 
									   @RequestParam("aid") String aid, Model model) {
		Adoption adopt = adoptionService.getAdoptionById(aid);
		model.addAttribute("adoption", adopt);
		
		return "/adoption/update";
	}
	
	@PostMapping("/update")
	public String submitUpdate(@ModelAttribute("updateAdoption") Adoption adoption) {
		
		adoptionService.updateCondition(adoption);
		
		return "redirect:/protection/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("aid") String aid, @RequestParam("username") String username) {
		//주 게시물
		adoptionService.deleteAdoption(aid);
		
		if(username.equals("admin")) {
			return "redirect:/adoption/adminList";
		} else {
			return "redirect:/adoption/myList?nid=" + username;
			
		}
		
	}
}
