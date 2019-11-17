package Entitys;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TYPE_TICKET")
public class TypeTicket {

	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	private Integer price;
	private Boolean available;

	@OneToMany(mappedBy = "typeticket", fetch = FetchType.EAGER)
	private Collection<BuyTicket> buytickets;

	public Collection<BuyTicket> getBuytickets() {
		return buytickets;
	}

	public void setBuytickets(Collection<BuyTicket> buytickets) {
		this.buytickets = buytickets;
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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

}
