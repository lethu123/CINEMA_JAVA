package Models;

import java.util.Date;

public class Films {
	private Integer id;
	private Integer type_film;
	private Integer category;
	private String name;
	private String actor;
	private String director;
	private String producer;
	private Integer duration;
	private String describe;
	private String trailer;
	private Integer evaluate;
	private Boolean is_show;
	private Date release;
	private String image_film;
	private Date create_at;
	private Date update_at;

	public Films() {
		super();
	}

	public Films(Integer id, Integer type_film, Integer category, String name, String actor, String director,
			String producer, Integer duration, String describe, String trailer, Integer evaluate, Boolean is_show,
			Date release, String image_film, Date create_at, Date update_at) {
		super();
		this.id = id;
		this.type_film = type_film;
		this.category = category;
		this.name = name;
		this.actor = actor;
		this.director = director;
		this.producer = producer;
		this.duration = duration;
		this.describe = describe;
		this.trailer = trailer;
		this.evaluate = evaluate;
		this.is_show = is_show;
		this.release = release;
		this.image_film = image_film;
		this.create_at = create_at;
		this.update_at = update_at;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType_film() {
		return type_film;
	}

	public void setType_film(Integer type_film) {
		this.type_film = type_film;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public Integer getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Integer evaluate) {
		this.evaluate = evaluate;
	}

	public Boolean getIs_show() {
		return is_show;
	}

	public void setIs_show(Boolean is_show) {
		this.is_show = is_show;
	}

	public Date getRelease() {
		return release;
	}

	public void setRelease(Date release) {
		this.release = release;
	}

	public String getImage_film() {
		return image_film;
	}

	public void setImage_film(String image_film) {
		this.image_film = image_film;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public Date getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(Date update_at) {
		this.update_at = update_at;
	}

}
