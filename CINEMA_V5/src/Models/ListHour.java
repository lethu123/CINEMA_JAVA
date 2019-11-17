package Models;

import java.util.List;

import Entitys.Film;
import Entitys.Showtime;

public class ListHour {
	private Film film;
	private String room;
	private List<Showtime> time;

	public ListHour() {
		super();
	}

	public ListHour(Film film, String room, List<Showtime> time) {
		super();
		this.film = film;
		this.room = room;
		this.time = time;
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public List<Showtime> getTime() {
		return time;
	}

	public void setTime(List<Showtime> time) {
		this.time = time;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

}
