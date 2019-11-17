package Models;

public class listQuery {
	private String bookingQuery;
	private String ticketQuery;
	private String time;

	public listQuery() {
		super();
	}

	public listQuery(String bookingQuery, String ticketQuery, String time) {
		super();
		this.bookingQuery = bookingQuery;
		this.ticketQuery = ticketQuery;
		this.time = time;
	}

	public String getBookingQuery() {
		return bookingQuery;
	}

	public void setBookingQuery(String bookingQuery) {
		this.bookingQuery = bookingQuery;
	}

	public String getTicketQuery() {
		return ticketQuery;
	}

	public void setTicketQuery(String ticketQuery) {
		this.ticketQuery = ticketQuery;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
