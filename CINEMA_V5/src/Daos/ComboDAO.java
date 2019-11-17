package Daos;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Entitys.Combo;

@Transactional
@Service("comboDao")
public class ComboDAO {

	@Autowired
	SessionFactory factory;
	
	//get list combo
	public List<Combo> getListCombo() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Combo";
			Query query = session.createQuery(sql);
			List<Combo> listCombo = query.list();
			for(Combo i:listCombo) {
				System.out.println("error get " + i.getName() );
			}
			return listCombo;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error get list combo");
		}
		
		return new ArrayList<>();
	}
	
	// get detail combo
	public Combo getDetail(int id){
		Combo combo = null;
		System.out.print("id combo"+id);
		Session session = factory.getCurrentSession();
		try {
			combo = (Combo) session.get(Combo.class, id);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("errors detail combo" + e.getMessage());
		}
		return combo;
	}
}
