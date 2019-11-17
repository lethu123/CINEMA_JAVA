package Daos;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entitys.Room;
import Entitys.Seat;
import Entitys.Showtime;
import Entitys.Ticket;
import Entitys.TypeTicket;
@Service
@Transactional
public class TicketDAO {

	@Autowired
	SessionFactory factory;
	
	// get detail type ticket
	public TypeTicket getDetail(int id){
		TypeTicket typeticket = null;
		System.out.print(id);
		Session session = factory.getCurrentSession();
		try {
			typeticket = (TypeTicket) session.get(TypeTicket.class, id);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("errors detail type ticket" + e.getMessage());
		}
		return typeticket;
	}
	
	// get detail seat
	public Seat getSeat(int id) {
		Seat seat = null;
		Session session = factory.getCurrentSession();
		try {
			seat = (Seat) session.get(Seat.class, id);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("errors detail seat" + e.getMessage());
		}
		return seat;
	}
	
	// get detail seat
		public Showtime getShowtime(int id) {
			Showtime showtime = null;
			Session session = factory.getCurrentSession();
			try {
				showtime = (Showtime) session.get(Showtime.class, id);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.print("errors detail seat" + e.getMessage());
			}
			return showtime;
		}
		
		
	// save ticket (bill)
	public String saveTicket(Ticket ticket) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(ticket);
			t.commit();
			System.out.println("them ve thanh cong!");
			return "Successfully";

		} catch (Exception e) {
			System.out.println("them ve that bai");
			t.rollback();
			return "failed!";
		} finally {
//			session.flush();
			session.close();
		}
	}
	
	
	// list seat in ticket table
	public List<Integer> getListSeat(String where){
		Session session = factory.getCurrentSession();
		String sql = "SELECT DISTINCT seat.id FROM Ticket WHERE " + where;
		System.out.println("chuoi truy van " + sql);
		Query query = session.createQuery(sql);
		List<Integer> list = query.list();
//		List<Seat> listSeat = new ArrayList<Seat> ();
//		for(Integer i:list) {
//			Seat seat = this.getSeat(i);
//			listSeat.add(seat);
//		}
		return list;
	}
	
	
	
	// list showtime in ticket table
		public List<Integer> getListShowtime(String where){
			Session session = factory.getCurrentSession();
			String sql = "SELECT DISTINCT showtime.id FROM Ticket WHERE " + where;
			System.out.println("chuoi truy van 2 " + sql);
			Query query = session.createQuery(sql);
			List<Integer> list = query.list();
//			List<Showtime> listShowtime = new ArrayList<Showtime> ();
//			for(Integer i:list) {
//				Showtime showtime = this.getShowtime(i);
//				listShowtime.add(showtime);
//			}
			return list;
		}
		
		
	
//	// list seat in ticket table
//	public List<Seat> getListSeat(String where){
//		Session session = factory.getCurrentSession();
//		String sql = "SELECT DISTINCT seat.id FROM Ticket WHERE " + where;
//		System.out.println("chuoi truy van " + sql);
//		Query query = session.createQuery(sql);
//		List<Integer> list = query.list();
//		List<Seat> listSeat = new ArrayList<Seat> ();
//		for(Integer i:list) {
//			Seat seat = this.getSeat(i);
//			listSeat.add(seat);
//		}
//		return listSeat;
//	}
//	
//	
//	
//	// list showtime in ticket table
//		public List<Showtime> getListShowtime(String where){
//			Session session = factory.getCurrentSession();
//			String sql = "SELECT DISTINCT showtime.id FROM Ticket WHERE " + where;
//			System.out.println("chuoi truy van 2 " + sql);
//			Query query = session.createQuery(sql);
//			List<Integer> list = query.list();
//			List<Showtime> listShowtime = new ArrayList<Showtime> ();
//			for(Integer i:list) {
//				Showtime showtime = this.getShowtime(i);
//				listShowtime.add(showtime);
//			}
//			return listShowtime;
//		}
}
