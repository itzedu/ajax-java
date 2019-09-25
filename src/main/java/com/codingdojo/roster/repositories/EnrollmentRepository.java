package com.codingdojo.roster.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.roster.models.Enrollment;

@Repository
public interface EnrollmentRepository extends CrudRepository<Enrollment, Long> {

}
