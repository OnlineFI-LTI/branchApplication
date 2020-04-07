package com.lti.hackathon.project.banking.locations.api.repository;

import org.springframework.data.repository.CrudRepository;

import com.lti.hackathon.project.banking.locations.api.entity.Location;

public interface LocationRepository extends CrudRepository<Location, Long> {

}
