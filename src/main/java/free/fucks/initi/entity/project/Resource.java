package free.fucks.initi.entity.project;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;
import free.fucks.initi.entity.AbstractEntity;
import free.fucks.initi.entity.account.User;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 07/12/2015
 */
@Entity
@Table(name = "RESOURCE", schema = "public")
@ToString(callSuper = true)
@JsonAutoDetect()
@EqualsAndHashCode(callSuper = true)
public class Resource extends AbstractEntity{

    @Setter
    private String name;
    
    @Getter
    @Setter
    @JsonIgnore
    @ManyToOne
    private User user;
    
    @Getter
    @Setter
    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    private Project project;

    public Resource(String name, User user, Project project) {
        this.name = name;
        this.user = user;
        this.project = project;
    }

    public Resource(String name, User user, Project project, Long id) {
        super(id);
        this.name = name;
        this.user = user;
        this.project = project;
    }

    public Resource() {
    }

    public Resource(Long id) {
        super(id);
    }
    
    public String getNome(){
        return this.user.getFirstName()+" "+this.user.getLastName();
    }
    
}
