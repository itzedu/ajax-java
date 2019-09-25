package com.codingdojo.roster.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.roster.models.Course;
import com.codingdojo.roster.models.Enrollment;
import com.codingdojo.roster.models.Student;
import com.codingdojo.roster.repositories.CourseRepository;
import com.codingdojo.roster.repositories.EnrollmentRepository;
import com.codingdojo.roster.repositories.StudentRepository;

@Service
public class MainService {
	@Autowired
	private StudentRepository sR;
	@Autowired
	private CourseRepository cR;
	@Autowired
	private EnrollmentRepository eR;

	public List<Student> getAllStudents()  {
		return sR.findAll();
	}
	
	public Student findStudentById(Long id) {
		Optional<Student> potentialStudent = sR.findById(id);
		if(potentialStudent.isPresent()) {
			return potentialStudent.get();
		}
		return null;
	}
	
	public List<Course> getAllCourses() {
		return cR.findAll();
	}

	public void saveEnrollment(Enrollment enrollment) {
		eR.save(enrollment);
	}
	
	public List<Course> getNonCourses(Student s) {
		ArrayList<String> currentCourseNames = new ArrayList<String>();
		List<Course> currentCourses = s.getCourses();
		
		if(currentCourses.size() == 0) {
			currentCourseNames.add("");
		} else {
			for(Course c : currentCourses) {
				currentCourseNames.add(c.getName());
			}			
		}
		
		return cR.findByNameNotIn(currentCourseNames);
	}

	public Student createStudent(String fName, String lName) {
		Student s = new Student();
		s.setFirstName(fName);
		s.setLastName(lName);
		
		return sR.save(s);
	}
	
}