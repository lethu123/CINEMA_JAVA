package Controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import Daos.AccountDAO;
import Entitys.Account;
import Models.Notify;
import Models.Permission;
import Models.TypeFilm;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
	@Autowired
	ServletContext context;
	@Autowired
	AccountDAO accountDao;

	Account account;
	// ServletContext context;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(ModelMap model) {
		List<Account> listAccount = accountDao.getListAccount(true);
		model.addAttribute("listAccount", listAccount);
		return "Admin/account/index";
	}

	// @RequestMapping(value="", method = RequestMethod.POST)
	// public String abc(ModelMap model, @RequestParam("is_active") Boolean
	// is_active) {
	// System.out.print(is_active);
	// List<Account> listAccount1 = accountDao.getListAccount(is_active);
	// model.addAttribute(_listAccount, listAccount1);
	// System.out.print("test1");
	// return "redirect:/admin/account";
	// }

	@RequestMapping(value = "detail/{username}", method = RequestMethod.GET)
	public String getDetail(ModelMap model, @PathVariable("username") String username) {
		Account account = accountDao.getDetail(username);
		model.addAttribute("detailAccount", account);
		return "Admin/account/detail";
	}

	// update
	@RequestMapping(value = "update/{username}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("username") String username,
			@ModelAttribute("detailAccount") Account account) {
		Account _account = accountDao.getDetail(username);
		model.addAttribute("detailAccount", _account);
		return "Admin/account/edit";
	}

	// update
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("detailAccount") Account account,
			@RequestParam("image") MultipartFile img, BindingResult errors) {
		account.setUpdate_at(new Date());
		try {
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
			if (_username.getEmail().compareTo(account.getEmail()) != 0  && accountDao.getByEmail(account.getEmail()) != null) {
				errors.rejectValue("email", "account", "Email đã tồn tại!");
			}

			if (errors.hasErrors()) {
				return "Admin/account/edit";

			} else {
				if (!img.isEmpty()) {
					String avatarPath = context.getRealPath("./assets/admin/images/" + img.getOriginalFilename());
					img.transferTo(new File(avatarPath));
					String avatar = img.getOriginalFilename();
					account.setAvatar(avatar);
				}
				accountDao.createOrUpdate(account);
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("mess error upload");
		}

		return "redirect:/admin/account";
	}

	// active
	// @RequestMapping(value="active/{username}", method= RequestMethod.POST)
	// public String active(ModelMap model,@PathVariable("username") String
	// username) {
	// Account _account = accountDao.getDetail(username);
	// _account.setIs_active(true);
	// String message = accountDao.createOrUpdate(_account);
	// System.out.print("mess" + message);
	// return "redirect:/admin/account";
	// }
	// delete
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Notify delete(@RequestParam("username") String username) {
		Notify noti = accountDao.delete(username);
		return noti;
	}

	// insert
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Account account = new Account();
		account.setIs_active(true);
		model.addAttribute("detailAccount", account);
		return "Admin/account/insert";
	}

	// create
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(ModelMap model, @ModelAttribute("detailAccount") Account account,
			@RequestParam("image") MultipartFile img, BindingResult errors) {
		account.setCreate_at(new Date());
		try {
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
			if (account.getPermission() == null) {
				errors.rejectValue("permission", "account", "Vui lòng không để trống quyền!");
			}

			Account _username = accountDao.getDetail(account.getUsername());
			if (_username != null) {
				errors.rejectValue("username", "account", "Tài khoản đã tồn tại!");
			}

			if (accountDao.getByEmail(account.getEmail()) != null) {
				errors.rejectValue("email", "account", "Email đã tồn tại!");
			}

			if (errors.hasErrors()) {
				return "Admin/account/insert";

			} else {
				if (!img.isEmpty()) {
					String avatarPath = context.getRealPath("./assets/admin/images/" + img.getOriginalFilename());
					img.transferTo(new File(avatarPath));
					String avatar = img.getOriginalFilename();
					account.setAvatar(avatar);
				}
				accountDao.createOrUpdate(account);
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("mess error upload");
		}

		return "redirect:/admin/account";
	}

	@ModelAttribute("permissions")
	public List<Permission> getPermissions() {
		List<Permission> permissions = new ArrayList<>();
		permissions.add(new Permission(1, "Quản lí"));
		permissions.add(new Permission(0, "Khách hàng"));
		return permissions;
	}

}
