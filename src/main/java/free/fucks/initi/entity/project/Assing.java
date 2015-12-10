package free.fucks.initi.entity.project;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import free.fucks.initi.entity.AbstractEntity;
import free.fucks.initi.entity.account.Profile;
import javax.persistence.Entity;
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
@Table(name = "ASSING", schema = "public")
@ToString(callSuper = true)
@JsonAutoDetect()
@EqualsAndHashCode(callSuper = true)
public class Assing extends AbstractEntity{
    
    @Getter
    @Setter
    private Resource resource;
    
    @Getter
    @Setter
    private Profile role;
    
    @Getter
    @Setter
    private Long effort;

    public Assing(Resource resource, Profile role, Long effort) {
        this.resource = resource;
        this.role = role;
        this.effort = effort;
    }

    public Assing(Resource resource, Profile role, Long effort, Long id) {
        super(id);
        this.resource = resource;
        this.role = role;
        this.effort = effort;
    }

    public Assing() {
    }

    public Assing(Long id) {
        super(id);
    }
    
    
}
