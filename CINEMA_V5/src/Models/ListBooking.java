package Models;

import java.util.List;

import Entitys.Booking;
import Entitys.BuyTicket;
import Entitys.Order;
import Entitys.Seat;
import Entitys.Showtime;
import Entitys.Ticket;

public class ListBooking {
	private String date;
	private List<Showtime> time;
	private List<Seat> seat;
	private List<Order> order;
	private List<BuyTicket> buyticket;

	public ListBooking() {
		super();
	}

	public ListBooking(String date, List<Showtime> time, List<Seat> seat, List<Order> order,
			List<BuyTicket> buyticket) {
		super();
		this.date = date;
		this.time = time;
		this.seat = seat;
		this.order = order;
		this.buyticket = buyticket;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public List<Showtime> getTime() {
		return time;
	}

	public void setTime(List<Showtime> time) {
		this.time = time;
	}

	public List<Seat> getSeat() {
		return seat;
	}

	public void setSeat(List<Seat> seat) {
		this.seat = seat;
	}

	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
	}

	public List<BuyTicket> getBuyticket() {
		return buyticket;
	}

	public void setBuyticket(List<BuyTicket> buyticket) {
		this.buyticket = buyticket;
	}

}
