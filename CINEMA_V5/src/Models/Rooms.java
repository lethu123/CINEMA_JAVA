package Models;

import java.util.List;

public class Rooms {
	private String nameRoom;
	private List<ListSeat> lines;

	public Rooms() {
		super();
	}

	public Rooms(String nameRoom, List<ListSeat> lines) {
		super();
		this.nameRoom = nameRoom;
		this.lines = lines;
	}

	public String getNameRoom() {
		return nameRoom;
	}

	public void setNameRoom(String nameRoom) {
		this.nameRoom = nameRoom;
	}

	public List<ListSeat> getLines() {
		return lines;
	}

	public void setLines(List<ListSeat> lines) {
		this.lines = lines;
	}

}
