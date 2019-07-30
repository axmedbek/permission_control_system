package permissions.dao;

import permissions.models.User;

import java.util.List;

public interface UserDao {
    User findByUserName(String username);
    void createUser(User user);
    List getAllUsers();
}
