package permissions.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import permissions.dao.UserDao;
import permissions.models.User;
import permissions.services.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    public User findUserByUsername(String username) {
        return userDao.findByUserName(username);
    }
}
