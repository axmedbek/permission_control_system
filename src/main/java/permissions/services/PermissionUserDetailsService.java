package permissions.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import permissions.models.Role;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("permissionUserDetailsService")
public class PermissionUserDetailsService implements UserDetailsService {

    private final UserService userService;

    @Autowired
    public PermissionUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        permissions.models.User user = userService.findUserByUsername(s);

        if (user == null){
            throw new UsernameNotFoundException("User not authorized");
        }

        List<GrantedAuthority> authorities = buildUserAuthority(user.getRole());
        return buildUsersForAuthentication(user,authorities);
    }

    private User buildUsersForAuthentication(permissions.models.User user,List<GrantedAuthority> role){
        return new User(user.getUsername(),user.getPassword(),
                true,true,
                true,true,role);
    }

    private List<GrantedAuthority> buildUserAuthority(Role role){
        Set<GrantedAuthority> grantedAuthoritySet = new HashSet<GrantedAuthority>();
        grantedAuthoritySet.add(new SimpleGrantedAuthority(role.getName()));
        return new ArrayList<GrantedAuthority>(grantedAuthoritySet);
    }
}
