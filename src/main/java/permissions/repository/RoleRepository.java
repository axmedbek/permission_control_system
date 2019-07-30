package permissions.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import permissions.dao.RoleDao;
import permissions.models.Role;

import java.util.List;

@Repository("roleRepository")
public class RoleRepository implements RoleDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public RoleRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void createRole(Role role) {
        Session session = null;
        Transaction transaction = null;
        try{
            session = this.sessionFactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            session.save(role);
            transaction.commit();
        }
        catch (Exception e){
            if (transaction != null){
                transaction.rollback();
            }
        }
        finally {
            if (session != null){
                session.close();
            }
        }
    }

    public Role getRoleById(int id) {
        Session session = null;
        Transaction transaction = null;
        Role role = null;
        try{
            session = this.sessionFactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            role = session.load(Role.class,id);
        }
        catch (Exception e){
            if (transaction != null){
                transaction.rollback();
            }
        }
        finally {
            if (session != null){
                session.close();
            }
        }
        return role;
    }

    public List getAllRoles() {
        List roles = null;
        Session session = null;
        try{
            session = sessionFactory.openSession();
            roles = session.createQuery("SELECT a FROM Role a",Role.class).getResultList();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        finally {
            if (session != null) session.close();
        }
        return roles;
    }
}
