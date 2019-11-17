package Controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import Daos.BookingDAO;
import Daos.FilmDAO;
import Daos.ShowtimeDAO;
import Daos.TicketDAO;
import Entitys.Account;
import Entitys.Booking;
import Entitys.BuyTicket;
import Entitys.Film;
import Entitys.Order;
import Entitys.Seat;
import Entitys.Showtime;
import Entitys.Ticket;
import Models.ListBooking;
import Models.listQuery;

//@Transactional
@Controller
public class HomeController {
	@Autowired
	FilmDAO filmDao;
	@Autowired
	BookingDAO bookingDao;
	@Autowired
	TicketDAO ticketDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(ModelMap model, Account account, HttpServletRequest request) {
		HttpSession session = request.getSession();
		account = (Account) session.getAttribute("userLogin");

		if (account != null) {
			System.out.println("test seession.... " + account.getEmail());
			System.out.println("test seession.... " + account.getFullname());
			model.addAttribute("sessionUser", account);
		}
		// film sap chieu
		List<Film> listFilm1 = filmDao.getListCategory1();
		model.addAttribute("listFilm1", listFilm1);

		// carousel
		String discription = "";
		for (Film i : listFilm1) {
			if (i.getDescribe().length() > 150) {
				discription = i.getDescribe().substring(0, 150) + "...";
				i.setDescribe(discription);
			}
		}
		model.addAttribute("listFilmCarousel", listFilm1);

		// top film
		List<Film> topFilm = filmDao.getTopFilm();
		model.addAttribute("topFilm", topFilm);

		// phim dang chieu
		List<Film> listFilm2 = filmDao.getListCategory2();
		model.addAttribute("listFilm2", listFilm2);

		return "Home/index";
	}

	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(ModelMap model, @PathVariable("id") int id) {
		Film film = new Film();
		film = filmDao.getDetailFilm(id);
		model.addAttribute("filmDetail", film);
		return "Home/detail";
	}

	@RequestMapping(value = "movie-playing", method = RequestMethod.GET)
	public String moviePlaying(ModelMap model) {
		List<Film> listFilm = filmDao.getAllListCategory1();
		model.addAttribute("listFilm", listFilm);
		return "Home/movie-playing";
	}

	@RequestMapping(value = "movie-commingsoon", method = RequestMethod.GET)
	public String movieComingSoon(ModelMap model) {
		List<Film> listFilm = filmDao.getAllListCategory2();
		model.addAttribute("listFilm", listFilm);
		return "Home/movie-commingsoon";
	}

	// get histtory booking
	// @SuppressWarnings("deprecation")
	@RequestMapping(value = "history", method = RequestMethod.GET )
	public String history(ModelMap model, Account account, HttpServletRequest request) {

		HttpSession session = request.getSession();
		account = (Account) session.getAttribute("userLogin");

		if (account != null) {

	
			model.addAttribute("listItem","showTicket");

		} else {
			model.addAttribute("mess_login", "Vui lòng đăng nhập để xem lịch sử vé!");
		}
		return "Home/history";
	}

	// day show film
	// @RequestMapping(value = "getTime", method = RequestMethod.POST)
	// @ResponseBody
	// public ListHour getTime(HttpServletRequest request) {
	// ListHour listHour = new ListHour();
	// try {
	// SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	// Date day_show = formatter.parse(request.getParameter("day_show"));
	// System.out.print(day_show);
	// String anc = request.getParameter("day_show");
	// listHour = showtimeDao.getTimeByDate(anc);
	// return listHour;
	//
	// } catch (Exception e) {
	// System.out.print("loi cho nay ne");
	// }
	//
	//// return new ArrayList<>();
	// return listHour;
	//
	// }

}
