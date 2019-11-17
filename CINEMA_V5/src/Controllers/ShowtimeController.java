package Controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Daos.FilmDAO;
import Daos.ShowtimeDAO;
import Entitys.Film;
import Entitys.Room;
import Entitys.Showtime;



@Controller
@RequestMapping("/admin/showtime")
public class ShowtimeController {

	@Autowired
	ShowtimeDAO showtimeDao;
	@Autowired
	FilmDAO filmDao;
	
	// index
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(ModelMap model) {
		List<Showtime> showtime = showtimeDao.getShowtime();
		model.addAttribute("listShowtime", showtime);
		return "Admin/showtime/index";
	}
	
	//insert
	@RequestMapping(value="insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Showtime showtime = new Showtime();
		model.addAttribute("showtimeDetail", showtime);
		return "Admin/showtime/insert";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute("showtimeDetail") Showtime _showtime) {
		System.out.print("day: " + _showtime.getDay_show());
		System.out.print("time: " + _showtime.getHour_show());
		
//		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
//		String stringDate = formatDate.format(_showtime.getDay_show());
//		Date date = formatDate.format(stringDate);
		
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		String stringDate = formatter.format(_showtime.getDay_show());
//		_showtime.setHour_show(new Date());
        try {
//        	Date date = formatter.parse(stringDate);
//        	Date test = formatter.format(date));
//            System.out.println("date1" + date);
//            System.out.println("date2" + formatter.format(date));

        } catch (Exception e) {
            e.printStackTrace();
        }
		
		String test = showtimeDao.CreateOrUpate(_showtime);
		System.out.print("test: " + test);
		return "redirect:/admin/showtime";
	}
	
	@ModelAttribute("listFilm")
	public List<Film> getListFilm() {
		List<Film> listFilm =  filmDao.getAllListCategory1();
		return listFilm;
	}
	
	@ModelAttribute("listRoom")
	public List<Room> getListRoom() {
		List<Room> listRoom =  showtimeDao.getRoom();
		return listRoom;
	}
}
