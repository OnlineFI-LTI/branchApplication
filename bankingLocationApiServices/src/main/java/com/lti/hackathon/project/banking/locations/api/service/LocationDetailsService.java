package com.lti.hackathon.project.banking.locations.api.service;

import com.lti.hackathon.project.banking.locations.api.model.LocationDetailsResponseModel;

public interface LocationDetailsService {
	LocationDetailsResponseModel getLoanApplicationsDetails(String locationCode);
}
