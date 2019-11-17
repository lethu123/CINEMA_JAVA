package Models;

import java.util.List;

import Entitys.Showtime;

public class ListDay {
	private String date;
	private String room;
	private List<Showtime> time;

	public ListDay() {
		super();
	}

	public ListDay(String date, String room, List<Showtime> time) {
		super();
		this.date = date;
		this.room = room;
		this.time = time;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public List<Showtime> getTime() {
		return time;
	}

	public void setTime(List<Showtime> time) {
		this.time = time;
	}

}
