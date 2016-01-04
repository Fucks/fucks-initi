package free.fucks.initi.entity.project;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import free.fucks.initi.entity.AbstractEntity;
import free.fucks.initi.entity.IEntity;
import free.fucks.initi.entity.account.Profile;
import free.fucks.initi.entity.account.User;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
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
@Table(name = "PROJECT", schema = "public")
@ToString(callSuper = true)
@JsonAutoDetect()
@EqualsAndHashCode(callSuper = true)
public class Project extends AbstractEntity {

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    @Column(columnDefinition = "TEXT")
    private String description;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;

    @Getter
    @Setter
    @Transient
    private List<Task> tasks;

    @Getter
    @Setter
    @Transient
    private List<Resource> resources;

    @Getter
    @Setter
    @Transient
    private List<Profile> roles;

    @Getter
    @Setter
    private Boolean canWrite;

    @Getter
    @Setter
    private Boolean canWriteOnParent;

    @Getter
    @Setter
    @Transient
    private List<Long> deletedTasksId;

    @Getter
    @Setter
    @ManyToOne(fetch = FetchType.EAGER)
    private User lastUpdatedResponsible;

    public Project(String name, String description, Date startDate, Date endDate, List<Task> tasks, List<Resource> resources, List<Profile> roles, Boolean canWrite, Boolean canWriteOnParent) {
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.tasks = tasks;
        this.resources = resources;
        this.roles = roles;
        this.canWrite = canWrite;
        this.canWriteOnParent = canWriteOnParent;
    }

    public Project(String name, String description, Date startDate, Date endDate, List<Task> tasks, List<Resource> resources, List<Profile> roles, Boolean canWrite, Boolean canWriteOnParent, Long id) {
        super(id);
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.tasks = tasks;
        this.resources = resources;
        this.roles = roles;
        this.canWrite = canWrite;
        this.canWriteOnParent = canWriteOnParent;
    }

    public Project() {
    }

    public Project(Long id) {
        super(id);
    }

}
