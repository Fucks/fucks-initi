package free.fucks.initi.entity.account;

import free.fucks.initi.entity.AbstractEntity;
import java.util.List;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
@Entity
@Table(name = "PERFIL_DE_ACESSO")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class Profile extends AbstractEntity {

    @Getter
    @Setter
    @Column(nullable = false, unique = true)
    private String name;

//    @Getter
//    @Setter
//    @CollectionTable
//    @Enumerated(EnumType.STRING)
//    private List<GrantedAuthority> autorithies;

    /**
     *
     */
    public Profile() {

    }
}
