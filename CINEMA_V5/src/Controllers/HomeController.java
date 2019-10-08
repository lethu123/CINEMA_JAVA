package Controllers;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Daos.FilmDAO;
import Entitys.Film;

//@Transactional
@Controller
public class HomeController {
	@Autowired
	FilmDAO filmDao;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index(ModelMap model) {
		// film sap chieu
		List<Film> listFilm1 = filmDao.getListCategory1();
		model.addAttribute("listFilm1", listFilm1);
	
		// top film
		List<Film> topFilm = filmDao.getTopFilm();
		model.addAttribute("topFilm", topFilm);
		
		// phim dang chieu
		List<Film> listFilm2 = filmDao.getListCategory2();
		model.addAttribute("listFilm2", listFilm2);
		
		return "Home/index";
	}
	
	@RequestMapping(value="detail/{id}", method=RequestMethod.GET)
	public String detail(ModelMap model, @PathVariable("id") int id) {
		Film  film = new Film();
		film = filmDao.getDetailFilm(id);
		model.addAttribute("filmDetail", film);
		return "Home/detail";
	}
	
	@RequestMapping(value="movie-playing", method=RequestMethod.GET)
	public String moviePlaying(ModelMap model) {
		List<Film> listFilm = filmDao.getAllListCategory1();
		model.addAttribute("listFilm", listFilm);
		return "Home/movie-playing";
	}
	
	@RequestMapping(value="movie-commingsoon", method=RequestMethod.GET)
	public String movieComingSoon(ModelMap model) {
		List<Film> listFilm = filmDao.getAllListCategory2();
		model.addAttribute("listFilm", listFilm);
		return "Home/movie-commingsoon";
	}
}
