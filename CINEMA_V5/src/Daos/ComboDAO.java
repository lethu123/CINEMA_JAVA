package Daos;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entitys.Combo;
import Entitys.TypeTicket;
import Models.Notify;

@Transactional
@Service("comboDao")
public class ComboDAO {

	@Autowired
	SessionFactory factory;

	// get list combo
	public List<Combo> getListCombos() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Combo";
			Query query = session.createQuery(sql);
			List<Combo> listCombo = query.list();
			for (Combo i : listCombo) {
				System.out.println("error get " + i.getName());
			}
			return listCombo;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error get list combo");
		}

		return new ArrayList<>();
	}

	public List<Combo> getListCombo() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Combo where available = 'true'";
			Query query = session.createQuery(sql);
			List<Combo> listCombo = query.list();
			for (Combo i : listCombo) {
				System.out.println("error get " + i.getName());
			}
			return listCombo;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error get list combo");
		}

		return new ArrayList<>();
	}

	// get detail combo
	public Combo getDetail(int id) {
		Combo combo = null;
		System.out.print("id combo" + id);
		Session session = factory.getCurrentSession();
		try {
			combo = (Combo) session.get(Combo.class, id);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("errors detail combo" + e.getMessage());
		}
		return combo;
	}

	// create or update combo
	public String createOrUpdateCombo(Combo combo) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(combo);
			t.commit();
			return "successfully!";
		} catch (Exception e) {
			t.rollback();
			return "fail!";
		} finally {
			session.close();
		}
	}

	// delete type ticket
	public Notify delete(int id) {
		Notify notify = null;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Combo combo = (Combo) session.get(Combo.class, id);
			session.delete(combo);
			t.commit();
			notify = new Notify(0, "successfully!");
			return notify;

		} catch (Exception e) {
			t.rollback();
			notify = new Notify(1, "Vui lòng xóa những thành phần liên quan !");
			return notify;
		} finally {
			session.close();
		}
	}
}
