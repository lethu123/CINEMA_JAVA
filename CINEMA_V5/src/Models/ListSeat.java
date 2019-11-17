package Models;

import java.util.List;

import Entitys.Seat;

public class ListSeat {
	private String nameLine;
	private List<Seat> list;

	public ListSeat() {
		super();
	}

	public ListSeat(String nameLine, List<Seat> list) {
		super();
		this.nameLine = nameLine;
		this.list = list;
	}

	public String getNameLine() {
		return nameLine;
	}

	public void setNameLine(String nameLine) {
		this.nameLine = nameLine;
	}

	public List<Seat> getList() {
		return list;
	}

	public void setList(List<Seat> list) {
		this.list = list;
	}

}
