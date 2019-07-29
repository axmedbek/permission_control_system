package permissions.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "projects")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "project_name",length = 45,nullable = false,unique = true)
    private String projectName;
    @Column(name = "project_description")
    @Type(type = "text")
    private String projectDescription;
    @ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    @JoinTable(name = "project_users",
            joinColumns = { @JoinColumn(name = "project_id",nullable = false,updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "user_id",nullable = false,updatable = false)}
    )
    private Set<User> users;
}
