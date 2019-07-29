package permissions.dao;

import permissions.models.User;

public interface UserDao {
    User findByUserName(String username);
}
