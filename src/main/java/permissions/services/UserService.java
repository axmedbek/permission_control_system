package permissions.services;

import permissions.models.User;

import java.util.List;

public interface UserService {
    User findUserByUsername(String username);
    void createUser(User user);
    List getAllUsers();
}
