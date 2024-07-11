package com.main.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.model.Content;
import com.main.model.User;
import com.main.service.BlogServiceImp;
import com.main.service.ContentServiceImp;

@Controller
public class BlogController {
	@Autowired
	private BlogServiceImp bsi;
	@Autowired
	private ContentServiceImp csi;

	// getting date
	public static String getDate(String date) {
		String[] months = {"January","February","march","April","may","June","July","august","September","October","November","December"};
		String[] separatedDate = date.split("-");
		//System.out.println(Arrays.toString(separatedDate)); => [2024, 08, 11]
		int monthIndex = 0;
		String strMonthIndex = separatedDate[1];
	    //System.out.println(strMonthIndex); this will give us the month digit i.e. 08 in above case
			monthIndex = Integer.parseInt(strMonthIndex);
		//System.out.println(months[monthIndex-1]); =>  august
		String newDate = "";
		for(int i = separatedDate.length-1; i>=0 ; i--) {
			if(i==1) {
				newDate = newDate+"-"+months[monthIndex-1]+"-";
			}else {
				newDate = newDate+separatedDate[i];
			}
		}
		return newDate;
	}
	
	@GetMapping("/")
	public String home(ModelMap model) {
		List<Content> contents = csi.findAll();
		System.out.println(contents);
		for(Content content : contents) {
			String[] date = content.getModify_date().split(" ");
			String newDate = getDate(date[0]);
			content.setModify_date(newDate);
		}
		model.put("contents", contents);
		return "home";
	}

	@GetMapping("/loginform")
	public String loginForm() {
		return "login";
	}

	@GetMapping("/registrationform")
	public String registrationForm() {
		return "registration";
	}

	// to add a new user
	@PostMapping("/new")
	// @ResponseBody
	public String addNewUser(@ModelAttribute User user, ModelMap model) {
		// checking user exists or not
		String email = user.getEmail();
		List<User> existingUsers = bsi.findAll();
		boolean flag = false;
		for (User users : existingUsers) {
			if (users.getEmail().equals(email)) {
				flag = true;
			}
		}
		System.out.println(flag);
		if (flag == true) {
			model.addAttribute("error", "Email Already Registered Please Login");
			return "registration";
		} else {
			int id = bsi.findId();
			user.setId(id);
			bsi.save(user);
			return "redirect:/userdetails/" + id;
		}
	}

	@GetMapping("/userdetails/{id}")
	public String userDetails(ModelMap model, @PathVariable int id) {
		User user = bsi.findById(id);
		// Step 1) Get All the Contents
		List<Content> allContents = csi.findAll();
		List<Content> onlyThisAuthorContent = new ArrayList<Content>();
		for (Content content : allContents) {
			// Step 2) get all the contents which contains the given author_id
			if (content.getAuthor_id() == id) {
				String[] date = content.getModify_date().split(" ");
				content.setModify_date(date[0]);
				onlyThisAuthorContent.add(content);
			}
		}
		//System.out.println(onlyThisAuthorContent); [] - this is never null
		if (user != null && onlyThisAuthorContent.size() != 0) {
			model.put("user", user);
			model.put("contents", onlyThisAuthorContent);
			//System.out.println(onlyThisAuthorContent);
			return "userhome";
		} else {
			model.put("user", user);
			//System.out.println(user);
			return "userhome";
		}
	}
	
	
	// To Login User
	@PostMapping("/login")
	public String loginUser(@RequestParam String email, @RequestParam String password, ModelMap model) {
		User user = bsi.authenticateUser(email, password);
		if(user != null) {
			int id = user.getId();
			return "redirect:/userdetails/"+id;
		}else {
			model.put("error", "Please Enter Valid Email and Password");
			return "login";
		}
	}
	
	//To update user details
	@PostMapping("/update/{id}")
	public String updateDetails(@ModelAttribute User user,@PathVariable int id) { 
		User updatedUser = bsi.update(user); System.out.println(updatedUser);
	 	return "redirect:/userdetails/"+id; 
	 }	
	
	// TO Add A new Blog
	@GetMapping("/newBlog/{id}")
	public String newBlog(@PathVariable int id, ModelMap model) {
		model.put("userid", id);
		return "addNewBlog";
	}
	
	
	@PostMapping("/saveNewBlog/{id}")
	public String saveNewBlog(@PathVariable int id,@RequestParam String author, @RequestParam String content, @RequestParam String title, @RequestParam String modify_date) {
		User user = bsi.findById(id);
		String email = user.getEmail();
		int author_id = id;
		int blog_id = csi.getId();
		
		String newDate = getDate(modify_date);
		Content newContent = new Content();
		newContent.setAuthor(author);
		newContent.setId(blog_id);
		newContent.setAuthor_id(author_id);
		newContent.setEmail(email);
		newContent.setTitle(title);
		newContent.setContent(content);
		newContent.setModify_date(newDate);
		
		csi.save(newContent);
		return "redirect:/userdetails/"+id;
	}
	
	
   // To update Content Details
	@PostMapping("/updateContent/{id}")
	public String updateContent(@RequestParam String modify_date,@RequestParam String title,@RequestParam String content,@RequestParam String author, @PathVariable int id) {
		Content existingContent = csi.findById(id); // We are getting all the content of a particular id
		int author_id = existingContent.getAuthor_id(); // Getting author id
		String[] tempDate = modify_date.split(" ");		
		String newDate = getDate(tempDate[0]);
		existingContent.setModify_date(newDate);
		existingContent.setContent(content);
		existingContent.setAuthor(author);
		existingContent.setTitle(title);
		csi.update(existingContent);		
		return "redirect:/userdetails/"+author_id;
	}
	
	// To get the user content update form
	@GetMapping("/update/{id}")
	public String updateContentForm(ModelMap model, @PathVariable int id) {
		System.out.println("Update");
		Content content = csi.findById(id);
		String[] date = content.getModify_date().split(" ");
		content.setModify_date(date[0]);
		System.out.println(content);
		model.put("content", content);
		return "updateContentForm";
	}
	
	
	// To delete Blog content
	@GetMapping("/delete/{id}")
	public String deleteContent(@PathVariable int id) {
		int author_id = 0;
		List<Content> contents = csi.findAll();
		for(Content content: contents) {
			if(content.getId() == id) {
				author_id = content.getAuthor_id();
			}
		}
		csi.deleteById(id);
		return "redirect:/userdetails/"+author_id;
	}
}
