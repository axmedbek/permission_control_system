package permissions.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import permissions.dao.RoleDao;
import permissions.models.Role;
import permissions.services.RoleService;

import java.util.List;

@Service("roleServiceImpl")
public class RoleServiceImpl implements RoleService {
    private final RoleDao roleDao;
    @Autowired
    public RoleServiceImpl(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    public void createRole(Role role) {
        roleDao.createRole(role);
    }

    public Role getRoleById(int id) {
        return roleDao.getRoleById(id);
    }

    public List getAllRoles() {
        return roleDao.getAllRoles();
    }
}
