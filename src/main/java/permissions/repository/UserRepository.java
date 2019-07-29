package permissions.repository;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import permissions.dao.UserDao;
import permissions.models.User;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserRepository implements UserDao {

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
}
