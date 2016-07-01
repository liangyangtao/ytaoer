package com.ytaoer.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class YearTreeController extends CommonController {

	@RequestMapping(value = "yearreadtree")
	public String readQuotasYear(HttpServletResponse response,
			HttpSession session, String nodeId, Model model) {

		try {
			responseJson(response, null);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
