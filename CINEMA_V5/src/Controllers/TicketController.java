package Controllers;

import java.util.List;

import javax.servlet.ServletContext;

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

import Daos.BookingDAO;
import Daos.ComboDAO;
import Daos.TicketDAO;
import Entitys.Combo;
import Entitys.Film;
import Entitys.TypeTicket;
import Models.Notify;

@Controller
@RequestMapping("/admin/")
public class TicketController {
	@Autowired
	ServletContext context;
	@Autowired
	BookingDAO bookingDao;
	@Autowired
	ComboDAO comboDao;
	@Autowired
	TicketDAO ticketDao;

	@RequestMapping(value = "typeticket", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "Admin/type_ticket/index";
	}

	@RequestMapping(value = "typeticket/insert", method = RequestMethod.GET)
	public String insertTK(ModelMap model) {
		TypeTicket ticket = new TypeTicket();
		model.addAttribute("detailTicket", ticket);
		return "Admin/type_ticket/insert";
	}

	@RequestMapping(value = "typeticket/insert", method = RequestMethod.POST)
	public String insertTK(@ModelAttribute("detailTicket") TypeTicket ticket,
			@RequestParam(value = "_is_available", required = false) String is_available, BindingResult errors) {

		if (ticket.getName().trim().length() == 0) {
			errors.rejectValue("name", "ticket", "Vui lòng nhập tên loại vé");
		}

		if (ticket.getPrice() == null || ticket.getPrice() <= 0) {
			errors.rejectValue("price", "ticket", "Vui lòng nhập giá vé");
		}

		if (is_available != null) {
			ticket.setAvailable(true);
		} else {
			ticket.setAvailable(false);
		}
		if (errors.hasErrors()) {
			return "Admin/type_ticket/insert";
		}
		ticketDao.CreateOrUpateTicket(ticket);
		return "redirect:/admin/typeticket";
	}

	// update typeTicket
	@RequestMapping(value = "typeticket/update/{id}", method = RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable("id") int id) {
		TypeTicket ticket = ticketDao.getDetail(id);
		model.addAttribute("detailTicket", ticket);
		return "Admin/type_ticket/edit";
	}

	@RequestMapping(value = "typeticket/update", method = RequestMethod.POST)
	public String editTK(@ModelAttribute("detailTicket") TypeTicket ticket,
			@RequestParam(value = "is_available", required = false) String is_available, BindingResult errors) {

		if (ticket.getName().trim().length() == 0) {
			errors.rejectValue("name", "ticket", "Vui lòng nhập tên loại vé");
		}

		if (ticket.getPrice() == null || ticket.getPrice() <= 0) {
			errors.rejectValue("price", "ticket", "Vui lòng nhập giá vé");
		}

		if (is_available != null) {
			ticket.setAvailable(true);
		} else {
			ticket.setAvailable(false);
		}
		if (errors.hasErrors()) {
			return "Admin/type_ticket/edit";
		}

		ticketDao.CreateOrUpateTicket(ticket);
		 return "redirect:/admin/typeticket";
	}
	
	//delete typeticket
		@RequestMapping(value = "typeticket/delete", method = RequestMethod.POST)
		@ResponseBody
		public Notify delete(@RequestParam("id") int id) {
			Notify noti = ticketDao.delete(id);
			return noti;
		}

	// @RequestMapping(value="typeticket", method = RequestMethod.POST)
	// public String test(@ModelAttribute("abcs") TypeTicket type) {
	//// System.out.print(type.getType());
	// return "redirect:/admin/typeticket";
	// }

	// add type ticket

	// list ticket
	@ModelAttribute("list_Ticket")
	public List<TypeTicket> getListTicket() {
		List<TypeTicket> listTicket = bookingDao.getListTickets();
		return listTicket;
	}
	
}
