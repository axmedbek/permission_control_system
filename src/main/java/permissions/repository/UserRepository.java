package permissions.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import permissions.dao.UserDao;
import permissions.models.User;

import java.util.List;

@Repository
public class UserRepository implements UserDao{

    private final SessionFactory sessionFactory;

    @Autowired
    public UserRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public User findByUserName(String username) {
        List users = null;
        users = sessionFactory.getCurrentSession()
                .createQuery("from User where username = :usr ")
                .setParameter("usr",username)
                .list();

        if (users.size() > 0){
            return (User) users.get(0);
        }

        return null;
    }

    public void createUser(User user) {
        Session session = null;
        Transaction transaction = null;
        try{
            session = this.sessionFactory.openSession();
            transaction = session.beginTransaction();
            transaction.begin();
            session.save(user);
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

    public List getAllUsers() {
        List users = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            users = session.createQuery("SELECT a FROM User a", User.class).getResultList();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session != null) session.close();
        }
        return users;
    }
}
