package permissions.seeders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.stereotype.Component;
import permissions.models.Role;
import permissions.models.User;
import permissions.services.RoleService;
import permissions.services.UserService;

import javax.annotation.PostConstruct;

@Component
public class DatabaseSeeder {

    private final RoleService roleService;
    private final UserService userService;

    @Autowired
    public DatabaseSeeder(RoleService roleService,UserService userService) {
        this.userService = userService;
        this.roleService = roleService;
    }

    @PostConstruct
    public void run(){
//         role create
        Role role = new Role("ROLE_ADMIN");
        roleService.createRole(role);
//        admin create

        User user = new User("axmedbek","123456",role);
        userService.createUser(user);
    }
}
