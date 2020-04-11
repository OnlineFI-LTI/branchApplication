package com.lti.hackathon.project.banking.locations.api.shared;

import static org.springframework.http.HttpStatus.valueOf;

import org.springframework.web.server.ResponseStatusException;

import feign.Response;
import feign.codec.ErrorDecoder;

public class FeignErrorDecoder implements ErrorDecoder {

	@Override
	public Exception decode(String methodKey, Response response) {
		switch (response.status()) {
		case 400:
			break;
		case 404: {
			if (methodKey.contains("getLoanSummaryDetails"))
				return new ResponseStatusException(valueOf(response.status()), "Loan Summary is not valid");
			break;
		}
		default:
			return new Exception(response.reason());
		}
		return null;
	}

}
