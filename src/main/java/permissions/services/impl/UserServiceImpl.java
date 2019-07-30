package permissions.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import permissions.dao.RoleDao;
import permissions.dao.UserDao;
import permissions.models.User;
import permissions.services.UserService;

import java.util.List;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

    private final UserDao userDao;
    private final RoleDao roleDao;

    @Autowired
    public UserServiceImpl(UserDao userDao,RoleDao roleDao) {
        this.userDao = userDao;
        this.roleDao = roleDao;
    }

    public User findUserByUsername(String username) {
        return userDao.findByUserName(username);
    }

    public void createUser(User user) {
        userDao.createUser(user);
    }

    public List getAllUsers() {
        return userDao.getAllUsers();
    }
}
