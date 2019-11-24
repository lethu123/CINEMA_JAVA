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

import Entitys.Account;
import Entitys.Booking;
import Entitys.BuyTicket;
import Entitys.Order;
import Entitys.Room;
import Entitys.Seat;
import Entitys.Showtime;
import Entitys.TypeTicket;

@Transactional
@Service("bookingDao")
public class BookingDAO {
	@Autowired
	SessionFactory factory;

	public List<TypeTicket> getListTickets() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM TypeTicket";
			Query query = session.createQuery(sql);
			List<TypeTicket> listTicket = query.list();
			return listTicket;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("eror get list type ticket");
		}
		return new ArrayList<>();
	}
	
	public List<TypeTicket> getListTicket() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM TypeTicket where available = 'true'";
			Query query = session.createQuery(sql);
			List<TypeTicket> listTicket = query.list();
			return listTicket;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("eror get list type ticket");
		}
		return new ArrayList<>();
	}

	// get detail room
	public Room getDetailRoom(String nameRoom) {
		Session session = factory.getCurrentSession();
		String sql = "FROM Room WHERE name = '" + nameRoom + "'";
		Query query = session.createQuery(sql);
		List<Room> room = query.list();
		return room.size() > 0 ? room.get(0) : null;
	}

	// insert booking
	public String saveBooking(Booking booking) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Integer id = (Integer) session.save(booking);
			t.commit();
			System.out.println("id: " + id);
			return Integer.toString(id);

		} catch (Exception e) {
			System.out.println("sai roi" + e.getMessage());
			t.rollback();
			return "failed!";
		} finally {
			// session.flush();
			session.close();
		}
	}

	// insert into buy typeticket
	public String saveBuyTicket(BuyTicket buyticket) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Integer id = (Integer) session.save(buyticket);
			t.commit();
			System.out.println("id: " + id);
			return Integer.toString(id);

		} catch (Exception e) {
			System.out.println("sai roi" + e.getMessage());
			t.rollback();
			return "failed!";
		} finally {
			// session.flush();
			session.close();
		}
	}

	// insert into buy order
	public String saveOrder(Order order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Integer id = (Integer) session.save(order);
			t.commit();
			System.out.println("id: " + id);
			return Integer.toString(id);

		} catch (Exception e) {
			System.out.println("sai roi" + e.getMessage());
			t.rollback();
			return "failed!";
		} finally {
			// session.flush();
			session.close();
		}
	}

	// get list booking by user login
	public List<Booking> getListBooking(String username) {
		Session session = factory.getCurrentSession();
		String sql = "FROM Booking WHERE account_id='" + username + "'";
		Query query = session.createQuery(sql);
		List<Booking> listBooking = query.list();
		return listBooking;
	}

	
	// get list order id
	public List<Order> getListOrders(String where) {
		Session session = factory.getCurrentSession();
		String sql = "FROM Booking WHERE " + where ;
		Query query = session.createQuery(sql);
		List<Booking> list = query.list();
		List<Order> listOrder = new ArrayList<Order> ();
		for(Booking i:list) {
			if(i.getOrder() != null) {
				System.out.println("oerder" + i.getOrder().getCombo().getName());
				Order order = this.getOrders(i.getOrder().getId());
				listOrder.add(order);
			}
			
		}
		return listOrder;
	}
	// get orderes by id orders
	public Order getOrders(int id) {
		Order order = null;
		Session session = factory.getCurrentSession();
		try {
			order = (Order) session.get(Order.class, id);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("errors detail seat" + e.getMessage());
		}
		return order;
	}

	
	// get butbooking by id buybooking
		public BuyTicket getBuyTickets(int id) {
			BuyTicket buyTicket = null;
			Session session = factory.getCurrentSession();
			try {
				buyTicket = (BuyTicket) session.get(BuyTicket.class, id);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.print("errors detail seat" + e.getMessage());
			}
			return buyTicket;
		}
	// get list buyticket
	public List<BuyTicket> getListBuyTickets(String where) {
		Session session = factory.getCurrentSession();
		String sql = "SELECT DISTINCT buyticket.id FROM Booking WHERE " + where;
		Query query = session.createQuery(sql);
		List<Integer> list = query.list();
		List<BuyTicket> listBuytickets = new ArrayList<BuyTicket> ();
		for(Integer i:list) {
			BuyTicket buyTicket = this.getBuyTickets(i);
			listBuytickets.add(buyTicket);
		}
		return listBuytickets;
	}

}
