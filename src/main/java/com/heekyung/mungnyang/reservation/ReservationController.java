package com.heekyung.mungnyang.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
	
	@GetMapping("/reservation")
	public String menuView() {
		return "reservation/reservation";
	}
}
