package permissions.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String username;
    @Column(name = "password",nullable = false,length = 255)
    @Size(min = 6,max = 20)
    @NotEmpty
    private String password;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinTable(name = "user_roles",
            joinColumns = {@JoinColumn(name = "user_id",referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "role_id",referencedColumnName = "id")}
    )
    private Role role;

    public User(String username,String password,Role role){
        this.username = username;
        this.password = password;
        this.role = role;
    }
}
