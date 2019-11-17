package Models;

import java.util.List;

public class FilmSession {
	private List<ListHour> list;

	public FilmSession() {
		super();
	}

	public FilmSession(List<ListHour> list) {
		super();
		this.list = list;
	}

	public List<ListHour> getList() {
		return list;
	}

	public void setList(List<ListHour> list) {
		this.list = list;
	}

}


