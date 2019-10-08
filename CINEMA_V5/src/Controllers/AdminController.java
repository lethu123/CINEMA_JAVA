package Controllers;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Daos.FilmDAO;
import Entitys.Film;
import Models.Category;
import Models.Films;
import Models.TypeFilm;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	FilmDAO filmDao;

	@RequestMapping(value = "film", method = RequestMethod.GET)
	public String index(ModelMap model ) {
		List<Film> listFilm = filmDao.getAllFilm();
		model.addAttribute("listFilm", listFilm);
//		model.addAttribute("category", listCategory);

		return "Admin/index";
	}
	
	@RequestMapping(value = "film/update/{id}", method = RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable("id") int id, @ModelAttribute("film") Film film) {
//		Film  _film = new Film();
		film = filmDao.getDetailFilm(id);
		String trailer = film.getTrailer();
		int index = trailer.indexOf("watch?v=");
		String _trailer = trailer.substring(0, index) + "embed/" + trailer.substring(index + 8);
		film.setTrailer(_trailer);
		model.addAttribute("filmDetail", film);
		return "Admin/editFilm";
	}
	
	
//	@RequestMapping(value = "film", method = RequestMethod.POST)
//	public String CreateOrUpdate( HttpServletRequest request) {
//		String id = request.getParameter("id");
//		String name = request.getParameter("name");
//		String is_show = request.getParameter("is_show");
//		String category = request.getParameter("category");
//		String type_film = request.getParameter("type_film");
//		String duration = request.getParameter("duration");
//		String release = request.getParameter("release");
//		String evaluate = request.getParameter("evaluate");
//		String producer = request.getParameter("producer");
//		String actor = request.getParameter("actor");
//		String image_film = request.getParameter("image_film");
//		String describe = request.getParameter("describe");
////		String describe = request.getParameter("describe");
//		
//		System.out.print(name);
//		return "kskj";
//	}
	
	

	@ModelAttribute("category")
	public List<Category> getCategorys() {
		List<Category> category = new ArrayList<>();
		category.add(new Category(1,"Phim đang chiếu"));
		category.add(new Category(2,"Phim sắp chiếu"));
		return category;
	}
	
	@ModelAttribute("typeFilm")
	public List<TypeFilm> getTypeFilms() {
		List<TypeFilm> typeFilm = new ArrayList<>();
		typeFilm.add(new TypeFilm(1,"Phim tình cảm"));
		typeFilm.add(new TypeFilm(2,"Phim hành động"));
		typeFilm.add(new TypeFilm(3,"Phim kinh dị"));
		typeFilm.add(new TypeFilm(4,"Phim hoạt hình"));
		return typeFilm;
	}
}
