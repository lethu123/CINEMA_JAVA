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
@Table(name = "BUY_TICKET")
public class BuyTicket {
	@Id
	@GeneratedValue
	private Integer id;
	private Integer amount;

	@ManyToOne
	@JoinColumn(name = "typeticket_id")
	private TypeTicket typeticket;

	@OneToMany(mappedBy = "buyticket", fetch = FetchType.EAGER)
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

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public TypeTicket getTypeticket() {
		return typeticket;
	}

	public void setTypeticket(TypeTicket typeticket) {
		this.typeticket = typeticket;
	}

}
