package permissions.services;

import permissions.models.User;

public interface UserService {
    User findUserByUsername(String username);
}
