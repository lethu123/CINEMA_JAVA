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

import Entitys.Account;
import Models.Notify;

@Transactional
@Service("accountDao")
public class AccountDAO {
	@Autowired
	SessionFactory factory;

	// get list account
	public List<Account> getListAccount(Boolean status) {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Account WHERE is_active= :status";
			Query query = session.createQuery(sql).setParameter("status", status);
			List<Account> listAccount = query.list();
			System.out.print("ok");
			return listAccount;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("error");
		}
		return new ArrayList<>();

	}

	// get detail account
	public Account getDetail(String username) {
		Account account = null;
		System.out.print(username);
		Session session = factory.getCurrentSession();
		try {
			account = (Account) session.get(Account.class, username);
		} catch (Exception e) {
			System.out.print("errors" + e.getMessage());
		}
		return account;
	}

	// get detail account by email
	public Account getByEmail(String email) {
		Account account = null;
		System.out.print(email);
		Session session = factory.getCurrentSession();
		String hql = "FROM Account u WHERE u.email = :email";
		Query query = session.createQuery(hql).setParameter("email", email);

		List<Account> list = query.list();
		for (Account i : list) {
			System.out.print(i.getFullname());
		}
		return list.size() > 0 ? list.get(0) : null;
	}

	// get login
	public Account login(String username, String password) {
		Account account = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM Account u WHERE u.username = :username AND u.password = :password";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		List<Account> list = query.list();
		for (Account i : list) {
			System.out.println("fullname...." +i.getFullname());
		}
		return list.size() > 0 ? list.get(0) : null;
	}
	
	// get login ad
		public Account loginAD(String username, String password) {
			Account account = null;
			Session session = factory.getCurrentSession();
			String hql = "FROM Account u WHERE u.username = :username AND u.password = :password AND u.permission ='1'";
			Query query = session.createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("password", password);
			List<Account> list = query.list();
			for (Account i : list) {
				System.out.println("fullname...." +i.getFullname());
			}
			return list.size() > 0 ? list.get(0) : null;
		}

	// create or update
	public String createOrUpdate(Account account) {
		// Notify notify = null;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(account);
			t.commit();
			System.out.print("toi day");
			return "Successfully";

		} catch (Exception e) {
			System.out.print("toi day");
			t.rollback();
			return "failed!";
		} finally {
//			session.flush();
			session.close();
		}
	}

	// delete
	public Notify delete(String username) {
		Notify notify = null;
		Account account;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			account = (Account) session.get(Account.class, username);
			session.delete(account);
//			notify = new Notify(0, "successfully!");
			t.commit();
			notify = new Notify(0, "successfully!");
			return notify;

		} catch (Throwable e) {
			t.rollback();
			notify = new Notify(1, "Vui lòng xóa những thành phần liên quan !");
			return notify;
		} finally {
			session.close();
		}
	}

}
