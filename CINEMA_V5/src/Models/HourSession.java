package Models;

import java.util.List;

public class HourSession {
	private List<ListDay> list;
	public HourSession() {
		super();
	}
	public HourSession(List<ListDay> list) {
		super();
		this.list = list;
	}

	public List<ListDay> getList() {
		return list;
	}

	public void setList(List<ListDay> list) {
		this.list = list;
	}
	
	

}
