package com.codingdojo.roster.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.roster.models.Student;
import com.codingdojo.roster.services.MainService;

@RestController
public class StudentApiCtrl {
	@Autowired
	private MainService mS;
	
	@PostMapping("/api/students")
	public Student createStudent(@RequestParam("firstName") String fName, @RequestParam("lastName") String lName) {
		return mS.createStudent(fName, lName);
	}
	
}
