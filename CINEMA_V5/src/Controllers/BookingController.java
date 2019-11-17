package Controllers;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Daos.BookingDAO;
import Daos.ComboDAO;
import Daos.FilmDAO;
import Daos.ShowtimeDAO;
import Daos.TicketDAO;
import Entitys.Account;
import Entitys.Booking;
import Entitys.BuyTicket;
import Entitys.Combo;
import Entitys.Film;
import Entitys.Line;
import Entitys.Order;
import Entitys.Room;
import Entitys.Seat;
import Entitys.Showtime;
import Entitys.Ticket;
import Entitys.TypeTicket;
import Models.FilmSession;
import Models.HourSession;
import Models.ListDay;
import Models.ListHour;
import Models.ListSeat;
import Models.NotiBooking;
import Models.Notify;
import Models.Rooms;


@Controller
public class BookingController {

	@Autowired
	ShowtimeDAO showtimeDao;
	@Autowired
	BookingDAO bookingDao;
	@Autowired
	ComboDAO comboDao;
	@Autowired
	FilmDAO filmDao;
	@Autowired
	TicketDAO ticketDao;

	// showtime date
	@RequestMapping(value = "showtimedate", method = RequestMethod.GET)
	// @SuppressWarnings("unchecked")
	public String showtimedate(ModelMap model, HttpSession session, HttpServletRequest request) {
		Showtime showtime = new Showtime();
		model.addAttribute("detailShowtime", showtime);
		String date = (String) session.getAttribute("chooseDay");
		model.addAttribute("chooseDay", date);
		HttpSession Session = request.getSession();
		FilmSession listFilm = (FilmSession) Session.getAttribute("listFilm");
		if (listFilm != null) {
			model.addAttribute("listFilm", listFilm);
		} else {
			System.out.print("test sesion null rooif nhas");

		}

		return "Home/showtimeDate";
	}

	@RequestMapping(value = "getTime", method = RequestMethod.POST)
	public String getTime(ModelMap model, @ModelAttribute("detailShowtime") Showtime showtime, HttpSession session) {
		SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");
		String date = formatDate.format(showtime.getDay_show());
		session.setAttribute("chooseDay", date);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String day_show = formatter.format(showtime.getDay_show());
		List<Showtime> list = showtimeDao.getByDate(day_show);
		List<ListHour> test123 = new ArrayList<ListHour>();
		List<Showtime> arr = new ArrayList<Showtime>();

		while (list.size() > 0) {
			Showtime test = list.get(0);
			for (int i = 0; i < list.size() - 1; i++) {
				if ((test.getFilm().getId() == list.get(i + 1).getFilm().getId())
						&& (test.getRoom().getId() == list.get(i + 1).getRoom().getId())) {
					arr.add(list.get(i + 1));
				}
			}
			arr.add(test);
			test123.add(new ListHour(test.getFilm(), test.getRoom().getName(), arr));
			list.remove(0);
			list.removeAll(arr);
			arr = new ArrayList<Showtime>();
		}

		session.setAttribute("listFilm", new FilmSession(test123));
		return "redirect:/showtimedate";

	}

	// showtime film
	@RequestMapping(value = "showtimefilm", method = RequestMethod.GET)
	public String showtimefilm(ModelMap model, HttpSession session, HttpServletRequest request) {
		List<Film> listFilm = filmDao.getAllListCategory1();
		Showtime showtime = new Showtime();
		model.addAttribute("detailShowtime2", showtime);
		model.addAttribute("listFilmCategory1", listFilm);

//		String film = (String) session.getAttribute("nameFilm");
		Film film = (Film) session.getAttribute("nameFilm");
		model.addAttribute("nameFilm", film);
		HttpSession Session = request.getSession();
		HourSession listHour = (HourSession) Session.getAttribute("listHour");
		if (listHour != null) {
			model.addAttribute("listHour", listHour);
		} else {
			System.out.print("test sesion null rooif nhas");

		}
		return "Home/showtimeFilm";
	}

	@RequestMapping(value = "getTimeByFilm", method = RequestMethod.POST)
	public String getTimeByFilm(ModelMap model, @ModelAttribute("detailShowtime2") Showtime showtime,
			HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		System.out.print("test film id = " + id);
//		String name_film = filmDao.getDetailFilm(Integer.valueOf(id)).getName();
//		session.setAttribute("nameFilm", name_film);
		Film name_film = filmDao.getDetailFilm(Integer.valueOf(id));
		session.setAttribute("nameFilm", name_film);
		List<Showtime> list = showtimeDao.getByFilm(id);
		List<ListDay> test123 = new ArrayList<ListDay>();
		List<Showtime> arr = new ArrayList<Showtime>();

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

		while (list.size() > 0) {
			Showtime test = list.get(0);
			for (int i = 0; i < list.size() - 1; i++) {
				String a = test.getDay_show().toString();
				String b = list.get(i + 1).getDay_show().toString();
				if ((a.compareTo(b) == 0) && (test.getRoom().getId() == list.get(i + 1).getRoom().getId())) {
					arr.add(list.get(i + 1));
				}
			}
			arr.add(test);
			String day_show = formatter.format(test.getDay_show());
			test123.add(new ListDay(day_show, test.getRoom().getName(), arr));

			list.remove(0);
			list.removeAll(arr);
			arr = new ArrayList<Showtime>();
		}

		session.setAttribute("listHour", new HourSession(test123));
		return "redirect:/showtimefilm";
	}

	@RequestMapping(value = "booking", params = { "date", "time", "film", "room" })
	public String getBooking(ModelMap model, @RequestParam("date") String date, @RequestParam("time") String time,
			@RequestParam("film") String film, @RequestParam("room") String room) {
		Film _film = filmDao.getDetailFilm(Integer.parseInt(film));
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("name_film", _film.getName());
		model.addAttribute("room", room);
		List<ListSeat> arrLine = new ArrayList<ListSeat>();
		List<Seat> arrSeat = new ArrayList<Seat>();
		Room _room = bookingDao.getDetailRoom(room);
		if (_room != null) {
			List<Line> lines = (List<Line>) _room.getLines();
			for (Line i : lines) {
				List<Seat> seats = (List<Seat>) i.getSeats();
				for (Seat j : seats) {
					arrSeat.add(j);
					System.out.println("seat name = " + j.getId());
				}
				arrLine.add(new ListSeat(i.getName(), arrSeat));
				System.out.println("line name = " + i.getName());
				arrSeat = new ArrayList<Seat>();
			}

			model.addAttribute("listSEAT", new Rooms(room, arrLine));

		}

		return "Home/booking";
	}

	// list ticket
	@ModelAttribute("listTicket")
	public List<TypeTicket> getListTicket() {
		List<TypeTicket> listTicket = bookingDao.getListTicket();
		return listTicket;
	}

	// List combo
	@ModelAttribute("listCombo")
	public List<Combo> getListCombo() {
		List<Combo> listCombo = comboDao.getListCombo();
		return listCombo;
	}

//	@RequestMapping(value = "removeShowtime", method = RequestMethod.POST)
//	@ResponseBody
//	public Boolean removeSession(HttpSession session) {
//
//		FilmSession test = (FilmSession) session.getAttribute("listFilm");
//		if (test != null) {
//			session.removeAttribute("listFilm");
//			return true;
//		}
//		return false;
//	}

	@RequestMapping(value = "bookingTick", method = RequestMethod.POST)
	@ResponseBody
	public NotiBooking bookingTicket(ModelMap model, HttpServletRequest request, @RequestParam("listSeat") String listSeat,
			@RequestParam("listCombo") String listCombo, @RequestParam("listTicket") String listTicket,
			@RequestParam("date") String date, @RequestParam("film") String film, @RequestParam("time") String time,
			@RequestParam("room") String room, @RequestParam("price") String price) {

		System.out.println("list ... " + listSeat);
		
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("userLogin");
		String res = "";
		
		if (account != null) {
			Film name_film = filmDao.getDetailFilm(Integer.valueOf(film));

			List<String> list_ticket_ls = new ArrayList<>();
			List<String> list_combo_ls = new ArrayList<>();
			List<String> list_seat_ls = new ArrayList<>();
			String[] list_ticket = listTicket.split(",");
			String[] list_combo = listCombo.split(",");
			String[] list_seat = listSeat.split(",");
			// convert day show
			String[] _DS = date.split("/");
			String _date = _DS[2] + "-" + _DS[1] + "-" + _DS[0];
			Showtime ShowTime = showtimeDao.getDetail(_date, time);

			if (listCombo.trim().length() == 0) {
				for (String _ticket : list_ticket) {
					BuyTicket buyticket = new BuyTicket();
					String[] list_id = _ticket.split("/");
					buyticket.setAmount(Integer.parseInt(list_id[1]));
					TypeTicket typeticket = ticketDao.getDetail(Integer.parseInt(list_id[0]));
					list_ticket_ls.add(list_id[1]+ " "+ typeticket.getName());
					buyticket.setTypeticket(typeticket);
					String _buyticket = bookingDao.saveBuyTicket(buyticket);

					if (_buyticket.compareTo("failed!") != 0) {
						System.out.println("theem bytiket thanh cong!");

						Booking booking = new Booking();
						booking.setAccount(account);
						booking.setCreate_at(new Date());
						booking.setBuyticket(buyticket);
						// booking.setOrder(order);
						String _booking = bookingDao.saveBooking(booking);
						System.out.println("res booking ... " + _booking);
						if (_booking.compareTo("failed!") != 0) {
							System.out.println("test thooi!");
							for (String _seat : list_seat) {
								Seat seat = ticketDao.getSeat(Integer.parseInt(_seat));
								list_seat_ls.add(seat.getLine().getName()+ seat.getName());
								Ticket _ticket2 = new Ticket();
								// bill ticket (table ticket)

								_ticket2.setBooking(booking);
								_ticket2.setSeat(seat);
								_ticket2.setShowtime(ShowTime);
								res = ticketDao.saveTicket(_ticket2);

								System.out.println("the end! 1" + res);

							}

						}
					}

				}
				
				return new NotiBooking(0, name_film.getName(), date, time, list_ticket_ls, new ArrayList<String>(),list_seat_ls,
						account.getUsername(), room, price);
				

			} else {
				// ticket
				for (String _ticket : list_ticket) {
					BuyTicket buyticket = new BuyTicket();
					String[] list_id = _ticket.split("/");
					buyticket.setAmount(Integer.parseInt(list_id[1]));
					TypeTicket typeticket = ticketDao.getDetail(Integer.parseInt(list_id[0]));
					list_ticket_ls.add(list_id[1]+ " "+ typeticket.getName());
					buyticket.setTypeticket(typeticket);
					String _buyticket = bookingDao.saveBuyTicket(buyticket);

					if (_buyticket.compareTo("failed!") != 0) {
						System.out.println("theem bytiket thanh cong!");
						// combo
						for (String _combo : list_combo) {
							Order order = new Order();
							String[] list_idCB = _combo.split("/");
							order.setAmount_combo(Integer.parseInt(list_idCB[1]));
							Combo _Combo = comboDao.getDetail(Integer.parseInt(list_idCB[0]));
							list_combo_ls.add(list_idCB[1] + " " + _Combo.getName());
							order.setCombo(_Combo);
							String _order = bookingDao.saveOrder(order);
							if (_order.compareTo("failed!") != 0) {
								// booking
								Booking booking = new Booking();
								booking.setAccount(account);
								booking.setCreate_at(new Date());
								booking.setBuyticket(buyticket);
								booking.setOrder(order);
								String _booking = bookingDao.saveBooking(booking);
								System.out.println("res booking ... " + _booking);
								if (_booking.compareTo("failed!") != 0) {
									System.out.println("test thooi!");
									for (String _seat : list_seat) {
										Seat seat = ticketDao.getSeat(Integer.parseInt(_seat));
										list_seat_ls.add(seat.getLine().getName()+ seat.getName());
										Ticket _ticket2 = new Ticket();
										// bill ticket (table ticket)

										_ticket2.setBooking(booking);
										_ticket2.setSeat(seat);
										_ticket2.setShowtime(ShowTime);
										res = ticketDao.saveTicket(_ticket2);

										System.out.println("the end! 2" + res);

									}

								}

							}
						}
					}

				}
				
				return new NotiBooking(0, name_film.getName(), date, time, list_ticket_ls, list_combo_ls,list_seat_ls,account.getUsername(), room, price);

			}
			
		} else {
//			return "please login!";
			return new NotiBooking(1, "", "", "", new ArrayList<String>(),  new ArrayList<String>(), new ArrayList<String>(),"", "", "");
		}

	}

}
