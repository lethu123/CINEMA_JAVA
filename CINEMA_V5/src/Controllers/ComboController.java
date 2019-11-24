package Controllers;

import java.util.List;

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

import Daos.ComboDAO;
import Entitys.Combo;
import Entitys.TypeTicket;
import Models.Notify;

@Controller
@RequestMapping("admin")
public class ComboController {
	@Autowired
	ComboDAO comboDao;
	
	@RequestMapping("combo")
	public String index(ModelMap model) {
		return "Admin/combo/index";
	}
	
	
	@RequestMapping(value = "combo/insert", method = RequestMethod.GET)
	public String insertTK(ModelMap model) {
		Combo ticket = new Combo();
		model.addAttribute("detailCombo", ticket);
		return "Admin/combo/insert";
	}

	@RequestMapping(value = "combo/insert", method = RequestMethod.POST)
	public String insertCB(@ModelAttribute("detailCombo") Combo combo,
			@RequestParam(value = "_is_available", required = false) String is_available, BindingResult errors) {

		if (combo.getName().trim().length() == 0) {
			errors.rejectValue("name", "ticket", "Vui lòng nhập tên combo");
		}

		if (combo.getPrice() == null || combo.getPrice() <= 0) {
			errors.rejectValue("price", "ticket", "Vui lòng nhập giá combo");
		}

		if (is_available != null) {
			combo.setAvailable(true);
		} else {
			combo.setAvailable(false);
		}
		if (errors.hasErrors()) {
			return "Admin/combo/insert";
		}
		comboDao.createOrUpdateCombo(combo);
		return "redirect:/admin/combo";
	}

	// update typeTicket
	@RequestMapping(value = "combo/update/{id}", method = RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable("id") int id) {
		Combo combo = comboDao.getDetail(id);
		model.addAttribute("detailCombo", combo);
		return "Admin/combo/edit";
	}

	@RequestMapping(value = "combo/update", method = RequestMethod.POST)
	public String editTK(@ModelAttribute("detailCombo") Combo combo,
			@RequestParam(value = "is_available", required = false) String is_available, BindingResult errors) {

		if (combo.getName().trim().length() == 0) {
			errors.rejectValue("name", "ticket", "Vui lòng nhập tên combo");
		}

		if (combo.getPrice() == null || combo.getPrice() <= 0) {
			errors.rejectValue("price", "ticket", "Vui lòng nhập giá combo");
		}

		if (is_available != null) {
			combo.setAvailable(true);
		} else {
			combo.setAvailable(false);
		}
		if (errors.hasErrors()) {
			return "Admin/combo/edit";
		}

		comboDao.createOrUpdateCombo(combo);
		 return "redirect:/admin/combo";
	}
	
	//delete typeticket
		@RequestMapping(value = "combo/delete", method = RequestMethod.POST)
		@ResponseBody
		public Notify delete(@RequestParam("id") int id) {
			Notify noti = comboDao.delete(id);
			return noti;
		}
		
		
	
	
	
	
	
	 //List combo
	 @ModelAttribute("list_Combo")
	 public List<Combo> getListCombo() {
	 List<Combo> listCombo = comboDao.getListCombos();
	 return listCombo;
	 }
}
