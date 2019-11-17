package Entitys;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ROOM")
public class Room {
	@Id
	@GeneratedValue
	private Integer id;

	private String name;
	private Integer amount_line;
	private Integer amount_seat;
	private Boolean is_full;

	@OneToMany(mappedBy = "room", fetch = FetchType.EAGER)
	private Collection<Showtime> showtimes;

	@OneToMany(mappedBy = "room", fetch = FetchType.EAGER)
	private Collection<Line> lines;
	
	public Collection<Line> getLines() {
		return lines;
	}

	public void setLines(Collection<Line> lines) {
		this.lines = lines;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAmount_line() {
		return amount_line;
	}

	public void setAmount_line(Integer amount_line) {
		this.amount_line = amount_line;
	}

	public Integer getAmount_seat() {
		return amount_seat;
	}

	public void setAmount_seat(Integer amount_seat) {
		this.amount_seat = amount_seat;
	}

	public Boolean getIs_full() {
		return is_full;
	}

	public void setIs_full(Boolean is_full) {
		this.is_full = is_full;
	}

	public Collection<Showtime> getShowtimes() {
		return showtimes;
	}

	public void setShowtimes(Collection<Showtime> showtimes) {
		this.showtimes = showtimes;
	}

}
