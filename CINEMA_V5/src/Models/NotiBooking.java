package Models;

import java.util.List;

public class NotiBooking {
	private Integer error_code;
	private String film;
	private String day;
	private String hour;
	private List<String> ticket;
	private List<String> combo;
	private List<String> seat;
	private String account;
	private String room;
	private String price;

	public NotiBooking() {
		super();
	}

	public NotiBooking(Integer error_code, String film, String day, String hour, List<String> ticket,
			List<String> combo, List<String> seat, String account, String room, String price) {
		super();
		this.error_code = error_code;
		this.film = film;
		this.day = day;
		this.hour = hour;
		this.ticket = ticket;
		this.combo = combo;
		this.seat = seat;
		this.account = account;
		this.room = room;
		this.price = price;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Integer getError_code() {
		return error_code;
	}

	public void setError_code(Integer error_code) {
		this.error_code = error_code;
	}

	public String getFilm() {
		return film;
	}

	public void setFilm(String film) {
		this.film = film;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public List<String> getTicket() {
		return ticket;
	}

	public void setTicket(List<String> ticket) {
		this.ticket = ticket;
	}

	public List<String> getCombo() {
		return combo;
	}

	public void setCombo(List<String> combo) {
		this.combo = combo;
	}

	public List<String> getSeat() {
		return seat;
	}

	public void setSeat(List<String> seat) {
		this.seat = seat;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

}
