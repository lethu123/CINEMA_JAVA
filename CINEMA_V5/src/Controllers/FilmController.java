package Controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import Daos.FilmDAO;
import Entitys.Account;
import Entitys.Film;
import Models.Category;
import Models.Films;
import Models.Notify;
import Models.TypeFilm;

@Controller
@RequestMapping("/admin/")
public class FilmController {
	@Autowired
	FilmDAO filmDao;

//	Films films;
//	Film film;

	// @Autowired

	@RequestMapping(value = "film", method = RequestMethod.GET)
	public String index(ModelMap model,  HttpServletRequest request) {
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("userLoginAD");

		if (account != null) {
			System.out.println("test seession.... " + account.getEmail());
			System.out.println("test seession.... " + account.getFullname());
			model.addAttribute("sessionUserAD", account);
		}
		
		List<Film> listFilm = filmDao.getAllFilm();
		model.addAttribute("listFilm", listFilm);
		// model.addAttribute("category", listCategory);
		return "Admin/film/index";
	}

	@RequestMapping(value = "film/update/{id}", method = RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable("id") int id, @ModelAttribute("film") Film film) {
		film = filmDao.getDetailFilm(id);
		String trailer = film.getTrailer();
		model.addAttribute("filmDetail", film);
		String _trailer = "";
		if (trailer.trim().length() != 0) {
			int index = trailer.indexOf("watch?v=");
			_trailer = trailer.substring(0, index) + "embed/" + trailer.substring(index + 8);
		}
		model.addAttribute("trailler", _trailer);
		return "Admin/film/edit";
	}

	// update
	@RequestMapping(value = "film/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("filmDetail") Film film, @RequestParam("_trailer") String trailler,
			@RequestParam("_is_show") Boolean is_show, BindingResult errors) {

		if (film.getName().trim().length() == 0) {
			errors.rejectValue("name", "film", "Vui lòng nhập tên phim");
		}
		if (film.getDuration() == null) {
			errors.rejectValue("duration", "film", "Vui lòng nhập thời lượng");
		}
		if (film.getRelease() == null) {
			errors.rejectValue("release", "film", "Vui lòng nhập ngày khởi chiếu");
		}
		if (film.getImage_film().trim().length() == 0) {
			errors.rejectValue("image_film", "film", "Vui lòng nhập hình ảnh");
		}
		Film _film = filmDao.getDetailFilm(film.getId());
		if (_film.getName().compareTo(film.getName()) != 0 && filmDao.getlFilmByName(film.getName()) != null) {
			errors.rejectValue("name", "film", "Vui lòng nhập trùng tên phim");
		}

		film.setIs_show(is_show);
		film.setUpdate_at(new Date());
		if (film.getTrailer().trim().length() == 0) {
			if (trailler.trim().length() != 0) {
				int trailers = trailler.indexOf("src");
				if (trailers == -1) {
					errors.rejectValue("trailer", "film", "Vui lòng nhập embed");
				}
				if (errors.hasErrors()) {
					return "Admin/film/edit";

				} else {
					trailler = trailler.substring(trailers + 5);
					int indexHref = trailler.indexOf("\"");
					trailler = trailler.substring(0, indexHref);
					int index = trailler.indexOf("embed/");
					trailler = trailler.substring(0, index) + "watch?v=" + trailler.substring(index + 6);
				}

			}
			film.setTrailer(trailler);
		}
		if (errors.hasErrors()) {
			return "Admin/film/edit";

		}
		String test = filmDao.CreateOrUpate(film);
		System.out.println("trailer..." + test);
		return "redirect:/admin/film";
	}

	@RequestMapping(value = "film/insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Film film = new Film();
		model.addAttribute("filmDetail", film);
		return "Admin/film/insert";
	}
	
	// insert
	@RequestMapping(value = "film/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute("filmDetail") Film film, @RequestParam("_trailer") String trailler,
			@RequestParam("_is_show") Boolean is_show, BindingResult errors) {

		if (film.getName().trim().length() == 0) {
			errors.rejectValue("name", "film", "Vui lòng nhập tên phim");
		}
		if (film.getDuration() == null) {
			errors.rejectValue("duration", "film", "Vui lòng nhập thời lượng");
		}
		if (film.getRelease() == null) {
			errors.rejectValue("release", "film", "Vui lòng nhập ngày khởi chiếu");
		}
		if (film.getImage_film().trim().length() == 0) {
			errors.rejectValue("image_film", "film", "Vui lòng nhập hình ảnh");
		}
		if (film.getType_film() == null) {
			errors.rejectValue("type_film", "film", "Vui lòng chọn thể loại phim");
		}
		
		if (film.getCategory() == null) {
			errors.rejectValue("category", "film", "Vui lòng chọn loại phim");
		}
		if ( filmDao.getlFilmByName(film.getName()) != null) {
			errors.rejectValue("name", "film", "Vui lòng nhập trùng tên phim");
		}

		film.setIs_show(is_show);
		film.setCreate_at(new Date());
		if (film.getTrailer().trim().length() == 0) {
			if (trailler.trim().length() != 0) {
				int trailers = trailler.indexOf("src");
				if (trailers == -1) {
					errors.rejectValue("trailer", "film", "Vui lòng nhập embed");
				}
				if (errors.hasErrors()) {
					return "Admin/film/insert";

				} else {
					trailler = trailler.substring(trailers + 5);
					int indexHref = trailler.indexOf("\"");
					trailler = trailler.substring(0, indexHref);
					int index = trailler.indexOf("embed/");
					trailler = trailler.substring(0, index) + "watch?v=" + trailler.substring(index + 6);
				}

			}
			film.setTrailer(trailler);
		}
		if (errors.hasErrors()) {
			return "Admin/film/insert";

		}
		String test = filmDao.CreateOrUpate(film);
		System.out.println("trailer..." + test);
		return "redirect:/admin/film";
	}
	
	//delete
	@RequestMapping(value = "film/delete", method = RequestMethod.POST)
	@ResponseBody
	public Notify delete(@RequestParam("id") int id) {
		Notify noti = filmDao.delete(id);
		return noti;
	}

	@ModelAttribute("category")
	public List<Category> getCategorys() {
		List<Category> category = new ArrayList<>();
		category.add(new Category(1, "Phim đang chiếu"));
		category.add(new Category(2, "Phim sắp chiếu"));
		return category;
	}

	@ModelAttribute("typeFilm")
	public List<TypeFilm> getTypeFilms() {
		List<TypeFilm> typeFilm = new ArrayList<>();
		typeFilm.add(new TypeFilm(1, "Phim tình cảm"));
		typeFilm.add(new TypeFilm(2, "Phim hành động"));
		typeFilm.add(new TypeFilm(3, "Phim kinh dị"));
		typeFilm.add(new TypeFilm(4, "Phim hoạt hình"));
		return typeFilm;
	}

	
}
