package Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String login(HttpServletRequest request, ModelMap model) {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.print(username);
		System.out.print(password);
		
		return "Home/index";
	}
}
