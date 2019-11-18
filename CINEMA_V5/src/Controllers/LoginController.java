package Controllers;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Daos.AccountDAO;
import Daos.Mailer;
import Entitys.Account;
import Entitys.Film;
import Models.FilmSession;
import Models.HourSession;
import Models.Notify;

@Controller
public class LoginController {
	@Autowired
	AccountDAO accountDao;
	@Autowired
	Mailer mailer;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		Account account = new Account();
		account.setIs_active(true);
		model.addAttribute("detailAccount", account);
		return "login/home";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginValidation(HttpSession session, ModelMap model, @ModelAttribute("detailAccount") Account account,
			BindingResult errors) {
		if (account.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "account", "Vui lòng không để trống username!");
		}
		if (account.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "account", "Vui lòng không để trống password!");
		}

		if (errors.hasErrors()) {
			return "login/home";
		} else {
			if (accountDao.login(account.getUsername(), account.getPassword()) == null) {
				model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
				Account _account = new Account();
				model.addAttribute("detailAccount", _account);
				return "login/home";
			} else {
				Account _account = accountDao.login(account.getUsername(), account.getPassword());
				System.out.println("fullname...." + _account.getFullname());
				session.setAttribute("userLogin", _account);
				return "redirect:/";
			}
		}

	}

	// login admin
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String loginAD(ModelMap model) {
		Account account = new Account();
		account.setIs_active(true);
		model.addAttribute("detailAccount", account);
		return "login/admin";
	}

	@RequestMapping(value = "admin", method = RequestMethod.POST)
	public String loginValidationAD(HttpSession session, ModelMap model,
			@ModelAttribute("detailAccount") Account account, BindingResult errors) {
		if (account.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "account", "Vui lòng không để trống username!");
		}
		if (account.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "account", "Vui lòng không để trống password!");
		}

		if (errors.hasErrors()) {
			return "login/admin";
		} else {
			if (accountDao.loginAD(account.getUsername(), account.getPassword()) == null) {
				model.addAttribute("message", "Vui lòng kiểm tra lại thông tin đăng nhập");
				Account _account = new Account();
				model.addAttribute("detailAccount", _account);
				return "login/admin";
			} else {
				Account _account = accountDao.loginAD(account.getUsername(), account.getPassword());
				System.out.println("fullname...." + _account.getFullname());
				session.setAttribute("userLoginAD", _account);
				return "redirect:/admin/film";
			}
		}

	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String signup(ModelMap model) {
		Account account = new Account();
		account.setIs_active(true);
		model.addAttribute("detailAccount", account);
		return "login/signup";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerValidation(HttpSession session, @ModelAttribute("detailAccount") Account account,
			BindingResult errors) {
		if (account.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "account", "Vui lòng không để trống username!");
		}
		if (account.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "account", "Vui lòng không để trống email!");
		}
		if (account.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "account", "Vui lòng không để trống password!");
		}
		if (account.getFullname().trim().length() == 0) {
			errors.rejectValue("fullname", "account", "Vui lòng không để trống họ tên!");
		}

		Account _username = accountDao.getDetail(account.getUsername());
		if (_username != null) {
			errors.rejectValue("username", "account", "Tài khoản đã tồn tại!");
		}
		if (accountDao.getByEmail(account.getEmail()) != null) {
			errors.rejectValue("email", "account", "Email đã tồn tại!");
		}
		if (errors.hasErrors()) {
			return "login/signup";
		} else {
			account.setCreate_at(new Date());
			account.setIs_active(true);
			account.setPermission(0);
			accountDao.createOrUpdate(account);
			return "redirect:/login";
		}

	}

	// flash login
	@RequestMapping("flashLogin")
	@ResponseBody
	public Notify flashLogin(HttpSession session, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		if (accountDao.login(username, password) == null) {
			return new Notify(1, "Tên đăng nhập hoặc mật khẩu không đúng");
		} else {
			Account _account = accountDao.login(username, password);
			session.setAttribute("userLogin", _account);
			return new Notify(0, _account.getUsername());
		}
	}

	// logout
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		// remove all session

		FilmSession _film_Session = (FilmSession) session.getAttribute("listFilm");
		if (_film_Session != null) {
			session.removeAttribute("listFilm");
		}

		Account account = (Account) session.getAttribute("userLogin");
		if (account != null) {
			session.removeAttribute("userLogin");
		}

		// show film by day
		String day = (String) session.getAttribute("chooseDay");
		if (day != null) {
			session.removeAttribute("chooseDay");
		}

		// show time by film
		Film film = (Film) session.getAttribute("nameFilm");
		if (film != null) {
			session.removeAttribute("nameFilm");
		}

		HourSession listHour = (HourSession) session.getAttribute("listHour");
		if (listHour != null) {
			session.removeAttribute("listHour");
		}

		return "redirect:/";

	}

	// logout ADMIN
	@RequestMapping("logoutAD")
	public String logoutAD(HttpSession session) {
		Account account = (Account) session.getAttribute("userLoginAD");
		if (account != null) {
			session.removeAttribute("userLoginAD");
		}
		return "redirect:/admin";
	}

	// check login admin
	@RequestMapping("checkLogin")
	@ResponseBody
	public Boolean checkLogin(HttpSession session) {
		Account account = (Account) session.getAttribute("userLoginAD");
		if (account != null) {
			return true;
		}
		return true;
	}

	@RequestMapping(value = "forgotPassword", method = RequestMethod.GET)
	public String forgetPass(ModelMap model) {

		return "login/forgetPassword";
	}

	// @SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
	public Notify sendEmail(ModelMap model, @RequestParam("email") String email) {
		Account account = accountDao.getByEmail(email);
		if (account != null) {
			String from = "thukara2016@gmail.com";
			String subject = "RESET PASSWORD";
			String body = "password của bạn là: 123";
			String passReset = "123";
			account.setPassword(passReset);
			accountDao.createOrUpdate(account);
			mailer.send(from, email, subject, body);
			return new Notify(0, "Vui lòng kiểm tra email để nhận password");

		}
		return new Notify(1, "Email không tồn tại vui lòng kiểm tra lại!");

	}

}
