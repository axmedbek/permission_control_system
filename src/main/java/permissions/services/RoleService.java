package permissions.services;

import permissions.models.Role;

import java.util.List;

public interface RoleService {
    void createRole(Role role);
    Role getRoleById(int id);
    List getAllRoles();
}
