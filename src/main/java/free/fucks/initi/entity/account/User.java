package free.fucks.initi.entity.account;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import free.fucks.initi.entity.AbstractEntity;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@Entity
@ToString(callSuper = true)
@Table(name = "USUARIO", schema = "public")
@EqualsAndHashCode(callSuper = true)
@JsonAutoDetect
public class User extends AbstractEntity implements UserDetails{

    @Getter
    @Setter
    @JsonProperty
    @Column(nullable = false)
    private String firstName;
    
    @Getter
    @Setter
    @JsonProperty
    @Column(nullable = false)
    private String lastName;
    
    @Getter
    @Setter
    @JsonProperty
    @Column(nullable = false, unique = true)
    private String email;
    
    @Setter
    @JsonProperty
    @Size(min = 8, message = "Senha deve conter no mínimo 8 caracteres.")
    @Column(nullable = false)
    private String password;
    
    @Setter
    @JsonProperty
    @Column(nullable = false, unique = true)
    private String username;
    
    /**
     * 
     */
    public User(){

    }
    
    public User(Long id, String firstName, String lastName, String email, String username) {
        super(id);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.username = username;
    }


    public User(String firstName, String lastName, String email, String password, String username) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.username = username;
    }

    public User(String firstName, String lastName, String email, String password, String username, Long id) {
        super(id);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.username = username;
    }

    /*
        USER DETAILS METODOS
    */
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
         return AuthorityUtils.createAuthorityList("USER");
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public String getPassword() {
        return this.password;
    }
}
