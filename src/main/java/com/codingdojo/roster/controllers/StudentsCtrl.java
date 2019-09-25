package com.codingdojo.roster.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.roster.models.Course;
import com.codingdojo.roster.models.Enrollment;
import com.codingdojo.roster.models.Student;
import com.codingdojo.roster.services.MainService;

@Controller
public class StudentsCtrl {
	@Autowired
	private MainService mS;
	
	@GetMapping("/students/{id}")
	public String show(@ModelAttribute("enrollmentObj") Enrollment enrollment, @PathVariable("id") Long id, Model model) {
		Student s = mS.findStudentById(id);
		List<Course> nonCurrentCourses = mS.getNonCourses(s);
		model.addAttribute("studentObj", s);
		model.addAttribute("nonCurrentCourses", nonCurrentCourses);
		return "showStudent.jsp";
	}
	
	@PostMapping("/addCourse")
	public String addCourseToStudent(@ModelAttribute("enrollmentObj") Enrollment enrollment) {
		mS.saveEnrollment(enrollment);
		return "redirect:/students/" + enrollment.getStudent().getId();
	}
	
	@GetMapping("/students/new")
	public String newStudent(Model model) {
		model.addAttribute("allStudents", mS.getAllStudents());
		return "newStudent.jsp";
	}
}
