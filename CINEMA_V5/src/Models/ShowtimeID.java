package Models;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class ShowtimeID implements Serializable {
	
	private Date day_show;
	private Date hour_show;

	public ShowtimeID() {
		super();
	}

	public ShowtimeID(Date day_show, Date hour_show) {
		super();
		this.day_show = day_show;
		this.hour_show = hour_show;
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

}
