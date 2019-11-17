package Daos;

import javax.transaction.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entitys.Film;
import Entitys.Room;
import Entitys.Showtime;
import Models.ListHour;
import Models.Notify;

@Transactional
@Service("showtimeDao")
public class ShowtimeDAO {
	@Autowired
	SessionFactory factory;

	// get all showtime
	public List<Showtime> getShowtime() {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM Showtime";
			Query query = session.createQuery(hql);
			List<Showtime> listTime = query.list();
			return listTime;
		} catch (Exception e) {
			System.out.print("loi roi");
		}
		return new ArrayList<>();
	}

	// get get showtime by date
	public List<Showtime> getByDate(String date) {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM Showtime WHERE day_show = '" + date + "'";
			Query query = session.createQuery(hql);
			List<Showtime> listTime = query.list();
			return listTime;

		} catch (Exception e) {
			System.out.print("loi roi");
		}
		return new ArrayList<Showtime>();
	}

	// get showtime by film
	public List<Showtime> getByFilm(String id) {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM Showtime WHERE film.id = '" + id + "'";
			Query query = session.createQuery(hql);
			List<Showtime> listTime = query.list();
			return listTime;

		} catch (Exception e) {
			System.out.print("loi roi");
		}
		return new ArrayList<Showtime>();
	}

	// get detail showtime
	public Showtime getDetail(String date, String time) {
		Session session = factory.getCurrentSession();

		String hql = "FROM Showtime WHERE day_show = '" + date + "' AND hour_show = '" + time + "'";
		Query query = session.createQuery(hql);
		List<Showtime> listTime = query.list();
		return listTime.size() > 0 ? listTime.get(0) : null;
	}

	// get list room
	public List<Room> getRoom() {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM Room";
			Query query = session.createQuery(hql);
			List<Room> listRoom = query.list();
			return listRoom;

		} catch (Exception e) {
			System.out.print("loi roi");
		}
		return new ArrayList<Room>();
	}

	// create or update
	public String CreateOrUpate(Showtime showtime) {
		// Notify notify;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(showtime);
			t.commit();
			return "successfully!";
		} catch (Exception e) {
			t.rollback();
			return "fail!";
		} finally {
			session.close();
		}
	}

}
