package com.codingdojo.roster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.roster.models.Course;

@Repository
public interface CourseRepository extends CrudRepository<Course, Long> {
	List<Course> findAll();
	
	List<Course> findByNameNotIn(List<String> currentCourses);
}
