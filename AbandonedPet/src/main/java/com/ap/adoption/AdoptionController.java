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


@Controller
@RequestMapping("/adoption")
public class AdoptionController {
	@Autowired
	AdoptionService adoptionService;
	
	@GetMapping("/addAdoption")
	public String requestAddAdoptionForm(@ModelAttribute("NewAdoption") Adoption adoption) {
		
		return "adoption/addAdoption";
	}
	
	@PostMapping("/addAdoption")
	public String submitAddAdoptionForm(@ModelAttribute("NewAdoption") Adoption adoption) {
		
		adoptionService.setNewAdoption(adoption);
		
		return "redirect:/adoption/list";
	}
	
	
	@GetMapping("/list")
	public String adoptionList(Model model) {
	    List<Adoption> list = adoptionService.getAllAdoptionList();
	    model.addAttribute("adoptionList", list);

	    return "adoption/list";
	}
	
	@GetMapping("/mylist")
	public String myAdoptionList(@RequestParam("aid") String aid, Model model) {
		List<Adoption> list = adoptionService.getMyAdoptionList(aid);
		model.addAttribute("adoptionList", list);
		
		return "adoption/list";
	}
	
	@GetMapping("/detail")
	public String requestAdoptionById(@RequestParam("aid") String aid, Model model) {
		//주 게시물
		Adoption adoptionById = adoptionService.getAdoptionById(aid);
		model.addAttribute("adoption", adoptionById);
		
		return "adoption/detail";
	}
	
	@GetMapping("/update")
	public String submitUpdateAdoption(@ModelAttribute("updateAdoption") Adoption adoption, 
									   @RequestParam("aid") String aid, Model model) {
		Adoption adopt = adoptionService.getAdoptionById(aid);
		model.addAttribute("adoption", adopt);
		
		return "adoption/update";
	}
	
	@PostMapping("/update")
	public String submitUpdate(@ModelAttribute("updateAdoption") Adoption adoption) {
		
		adoptionService.updateCondition(adoption);
		
		return "redirect:/adoption/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("aid") String aid) {
		//주 게시물
		adoptionService.deleteAdoption(aid);
		
		return "redirect:/adoption/list";
	}
}
