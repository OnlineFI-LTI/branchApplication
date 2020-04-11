package com.lti.hackathon.project.banking.locations.api.shared;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.lti.hackathon.project.banking.locations.api.model.LoansResponseModel;

import feign.FeignException;
import feign.hystrix.FallbackFactory;

@FeignClient(name = "loans-ws", fallbackFactory = LoansFallbackFactory.class)
public interface LoansServiceClient {

	@GetMapping("/loans/loansSummary/{locationId}")
	public LoansResponseModel getLoanSummary(@PathVariable String locationId);

}

@Component
class LoansFallbackFactory implements FallbackFactory<LoansServiceClient> {

	@Override
	public LoansServiceClient create(Throwable cause) {
		return new LoansServiceClientFallback(cause);
	}
}

class LoansServiceClientFallback implements LoansServiceClient {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	private final Throwable cause;

	public LoansServiceClientFallback(Throwable cause) {
		this.cause = cause;
	}

	@Override
	public LoansResponseModel getLoanSummary(String locationId) {
		if (cause instanceof FeignException && ((FeignException) cause).status() == 404) {
			logger.error("404 error took place when getLocationSummary was called with userId: " + locationId
					+ ", Error Message : " + cause.getLocalizedMessage());
		} else {
			logger.error("Other Error took place: " + cause.getLocalizedMessage());
		}
		return new LoansResponseModel();
	}
}