package Controllers;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Daos.BookingDAO;
import Daos.ComboDAO;
import Entitys.Combo;
import Entitys.TypeTicket;

@Controller
@RequestMapping("/admin/")
public class TicketController {
	@Autowired
	ServletContext context;
	@Autowired
	BookingDAO bookingDao;
	@Autowired
	ComboDAO comboDao;
	
	@RequestMapping(value="typeticket", method = RequestMethod.GET)
	public String index(ModelMap model ){
		TypeTicket typeTicket = new TypeTicket();
		model.addAttribute("abcs", typeTicket);
//		System.out.print(typeTicket.getName());
		return "Admin/type_ticket/index";
	}
	
	@RequestMapping(value="typeticket", method = RequestMethod.POST) 
	public String test(@ModelAttribute("abcs") TypeTicket type, @RequestParam("hihi") MultipartFile haha) {
		System.out.print("test" + haha.getOriginalFilename());
//		System.out.print(type.getType());
		return "redirect:/admin/typeticket";
	}
	
	
//	//list ticket
//	@ModelAttribute("listTicket")
//	public List<TypeTicket> getListTicket() {
//		List<TypeTicket> listTicket = bookingDao.getListTicket();
//		return listTicket;
//	}
//	
//	//List combo
//	@ModelAttribute("listCombo")
//	public List<Combo> getListCombo() {
//		List<Combo> listCombo = comboDao.getListCombo();
//		return listCombo;
//	}
}
