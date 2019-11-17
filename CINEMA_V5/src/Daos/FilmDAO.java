package Daos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import Entitys.Account;
import Entitys.Film;
import Models.Notify;

//@Repository
@Transactional
@Service("filmDao")

public class FilmDAO {
	@Autowired
	SessionFactory factory;
	// category = 1 la phim dang chieu, category = 2 là phim sap chieu;
	// type = 1 phim tinh cam, type = 2 phim hanh dong

	// get all film
	public List<Film> getAllFilm() {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM Film";
			Query query = session.createQuery(hql);
			List<Film> listFilm = query.list();
			return listFilm;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("error");
		}
		return new ArrayList<>();
	}

	// list top phim dang chieu
	public List<Film> getListCategory1() {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM Film WHERE category = '1'";
			Query query = session.createQuery(hql).setMaxResults(8);
			List<Film> listCategory1 = query.list();
			return listCategory1;
		} catch (Exception e) {
			System.out.print("loi roi");
		}
		return new ArrayList<>();
	}

	// list phim dang chieu
	public List<Film> getAllListCategory1() {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM Film WHERE category = '1'";
			Query query = session.createQuery(hql);
			List<Film> listCategory1 = query.list();
			return listCategory1;
		} catch (Exception e) {
			System.out.print("loi roi");
		}
		return new ArrayList<>();
	}

	// list top phim sap chieu
	public List<Film> getListCategory2() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Film WHERE category = '2'";
		Query query = session.createQuery(hql).setMaxResults(6);
		List<Film> listCategory2 = query.list();
		return listCategory2;
	}

	// list phim sap chieu
	public List<Film> getAllListCategory2() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Film WHERE category = '2'";
		Query query = session.createQuery(hql);
		List<Film> listCategory2 = query.list();
		return listCategory2;
	}

	// top film
	public List<Film> getTopFilm() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Film WHERE category = '1'";
		Query query = session.createQuery(hql).setMaxResults(5);
		List<Film> topFilm = query.list();
		return topFilm;
	}

	// get detail film
	public Film getDetailFilm(int id) {
		Film film = null;
		Session session = factory.getCurrentSession();
		// String hql = "FROM Film WHERE id = :id";
		// Query query = session.createQuery(hql).setParameter("id", id);
		// List<Film> filmDetail = query.list();
		// return filmDetail.size() > 0 ? filmDetail.get(0) : null;
		try {
			film = (Film) session.get(Film.class, id);
		} catch (Exception e) {
			System.out.print("loi khong lay duowc film ");
		}

		return film;
	}

	// get film by name
	public Film getlFilmByName(String name) {
		Film film = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM Film f WHERE f.name = :name";
		Query query = session.createQuery(hql).setParameter("name", name);

		List<Film> list = query.list();
		return list.size() > 0 ? list.get(0) : null;
	}

	public String CreateOrUpate(Film film) {
		// Notify notify;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(film);
			t.commit();
			return "successfully!";
		} catch (Exception e) {
			t.rollback();
			return "fail!";
		} finally {
			session.close();
		}
	}

	// delete
	public Notify delete(int id) {
		Notify notify = null;
		Film film;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			film = (Film) session.get(Film.class, id);
			session.delete(film);
			t.commit();
			notify = new Notify(0, "successfully!");
			return notify;

		} catch (Throwable e) {
			t.rollback();
			notify = new Notify(1, "Vui lòng xóa những thành phần liên quan !");
			return notify;
		} finally {
			session.close();
		}
	}

}
