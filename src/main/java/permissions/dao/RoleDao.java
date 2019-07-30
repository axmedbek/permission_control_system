package permissions.dao;

import permissions.models.Role;

import java.util.List;

public interface RoleDao {
    void createRole(Role role);
    Role getRoleById(int id);
    List getAllRoles();
}
