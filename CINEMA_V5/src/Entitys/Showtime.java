package Entitys;

import java.sql.Time;
import java.util.*;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
//@IdClass(ShowtimeID.class)
@Table(name = "SHOWTIME")
public class Showtime {
	@Id
	@GeneratedValue
	private Integer id;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date day_show;

	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "hh:mm:ss")
	private Date hour_show;

	@ManyToOne
	@JoinColumn(name = "film_id")
	private Film film;

	@ManyToOne
	@JoinColumn(name = "room_id")
	private Room room;

	@OneToMany(mappedBy = "showtime", fetch = FetchType.EAGER)
	private Collection<Ticket> tickets;

	public Collection<Ticket> getTickets() {
		return tickets;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setTickets(Collection<Ticket> tickets) {
		this.tickets = tickets;
	}

	public Date getDay_show() {
		return day_show;
	}

	public void setDay_show(Date day_show) {
		this.day_show = day_show;
	}

	public Date getHour_show() {
		return hour_show;
	}

	public void setHour_show(Date hour_show) {
		this.hour_show = hour_show;
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

}
