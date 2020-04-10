package com.lti.hackathon.project.banking.locations.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lti.hackathon.project.banking.locations.api.model.LocationDetailsResponseModel;
import com.lti.hackathon.project.banking.locations.api.service.LocationDetailsService;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/locations")
public class LocationDetailsController {
	
	@Autowired
	LocationDetailsService locationDetailsService;

	@GetMapping("/status/check")
	public String getLocationsDetails() {
		return "it works";
	}
	
	@GetMapping(value = "/locationSummary/{locationId}")
	public LocationDetailsResponseModel getLoacationSummaryDetails(@PathVariable("locationId") String locationid) {
		LocationDetailsResponseModel responseModel = locationDetailsService.getLoanApplicationsDetails(locationid);
		return responseModel;
	}
	
}
