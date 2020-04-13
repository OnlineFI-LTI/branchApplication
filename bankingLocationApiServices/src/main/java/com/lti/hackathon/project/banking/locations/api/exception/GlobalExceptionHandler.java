package com.lti.hackathon.project.banking.loans.api.exception;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(Exception.class)
	public ResponseEntity<String> handleSQLException(HttpServletRequest request, Exception ex) {
		logger.info("Exception Occured:: URL=" + request.getRequestURL());
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}

}
