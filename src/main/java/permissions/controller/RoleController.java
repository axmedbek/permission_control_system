package permissions.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import permissions.services.RoleService;
import permissions.services.UserService;

@Controller
public class RoleController {

    private final RoleService roleService;

    private final UserService userService;

    @Autowired
    public RoleController(RoleService roleService, UserService userService) {
        this.roleService = roleService;
        this.userService = userService;
    }

    @RequestMapping("/roles")
    public String rolePage(Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        return "roles";
    }

    @RequestMapping(value = "/roles/load", method = RequestMethod.POST)
    public String loadModal(@RequestParam("type") String type,Model model) {
        if ("users".equals(type)) {
            // users
            model.addAttribute("users",userService.getAllUsers());
            model.addAttribute("header","Users for Permission");
            return "modals/role_users_modal";
        }
        else if ("modules".equals(type)){
            model.addAttribute("header","Modules for Permission");
            return "modals/role_modules_modal";
        }
        else if ("edit".equals(type)){
            model.addAttribute("header","Permission Edit");
            return "modals/role_edit_modal";
        }
        else if ("delete".equals(type)){
            model.addAttribute("header","Permission Delete");
            return "modals/role_delete_modal";
        }
        return null;
    }
}
