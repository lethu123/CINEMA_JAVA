package Entitys;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ORDERS")
public class Order {
	@Id
	@GeneratedValue
	private Integer id;
	private Integer amount_combo;

	@ManyToOne
	@JoinColumn(name = "combo_id")
	private Combo combo;
	
	@OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
	private Collection<Booking> Bookings;
	

	public Collection<Booking> getBookings() {
		return Bookings;
	}

	public void setBookings(Collection<Booking> bookings) {
		Bookings = bookings;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAmount_combo() {
		return amount_combo;
	}

	public void setAmount_combo(Integer amount_combo) {
		this.amount_combo = amount_combo;
	}

	public Combo getCombo() {
		return combo;
	}

	public void setCombo(Combo combo) {
		this.combo = combo;
	}

}
