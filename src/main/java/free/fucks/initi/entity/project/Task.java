package free.fucks.initi.entity.project;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import free.fucks.initi.entity.AbstractEntity;
import java.util.Date;
import java.util.List;
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
@Table(name = "TASK", schema = "public")
@ToString(callSuper = true)
@JsonAutoDetect()
@EqualsAndHashCode(callSuper = true)
public class Task extends AbstractEntity {

    @Getter
    @Setter
    @Column
    private String name;

    @Getter
    @Setter
    @Column
    private String nivel;

    @Getter
    @Setter
    @Column
    private Integer level;

    @Getter
    @Setter
    @Column
    private Integer projectIndex;

    @Getter
    @Setter
    @Column
    private TaskStatus status;

    @Getter
    @Setter
    @JsonIgnore
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;

    @Getter
    @Setter
    @JsonIgnore
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;

    @Getter
    @Setter
    @Column
    private Boolean startIsMilestone;

    @Getter
    @Setter
    @Column
    private Boolean endIsMilestone;

    @Getter
    @Setter
    @OneToMany(fetch = FetchType.EAGER)
    private List<Assing> assigs;

    @Getter
    @Setter
    @Column
    private String depends;

    @Getter
    @Setter
    @Column
    private String description;

    @Getter
    @Setter
    @Column
    private Integer progress;

    @Getter
    @Setter
    @Column
    private Integer duration;

    @Getter
    @Setter
    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    private Project project;

    @Getter
    @Setter
    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    private Task parent;

    @Getter
    @Setter
    @Transient
    private Boolean hasChild;

    @Setter
    @Transient
    private String taskParentId;

    @Setter
    @Transient
    private String inprojectId;

    public Task(String name, String nivel, Integer level, TaskStatus status, Date startDate, Date endDate, Boolean startIsMilestone, Boolean endIsMilestone, List<Assing> assigs, String depends, String description, Integer progress, Integer duration, Project project, Task parent, Boolean hasChild) {
        this.name = name;
        this.nivel = nivel;
        this.level = level;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startIsMilestone = startIsMilestone;
        this.endIsMilestone = endIsMilestone;
        this.assigs = assigs;
        this.depends = depends;
        this.description = description;
        this.progress = progress;
        this.duration = duration;
        this.project = project;
        this.parent = parent;
        this.hasChild = hasChild;
    }

    public Task(String name, String nivel, Integer level, TaskStatus status, Date startDate, Date endDate, Boolean startIsMilestone, Boolean endIsMilestone, List<Assing> assigs, String depends, String description, Integer progress, Integer duration, Project project, Task parent, Boolean hasChild, Long id) {
        super(id);
        this.name = name;
        this.nivel = nivel;
        this.level = level;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startIsMilestone = startIsMilestone;
        this.endIsMilestone = endIsMilestone;
        this.assigs = assigs;
        this.depends = depends;
        this.description = description;
        this.progress = progress;
        this.duration = duration;
        this.project = project;
        this.parent = parent;
        this.hasChild = hasChild;
    }

    public Task() {
    }

    public Task(Long id) {
        super(id);
    }

    /*
     * GANTT JSON PROPERTIES
     */
    @JsonProperty("start")
    public long getStart() {
        return this.startDate.getTime();
    }

    public void setStart(long start) {
        this.startDate = new Date(start);
    }

    @JsonProperty("end")
    public long getEnd() {
        return this.endDate.getTime();
    }

    public void setEnd(long end) {
        this.endDate = new Date(end);
    }

    @JsonProperty("code")
    public String getCode() {
        return this.nivel;
    }

    public void setCode(String code) {
        this.nivel = code;
    }

    public String getInprojectId() {
        if (this.inprojectId == null) {
            return String.valueOf(this.id);
        } else {
            return this.inprojectId;
        }
    }

    public String getTaskParentId() {
        if (this.taskParentId == null && this.getParent() != null) {
            return String.valueOf(this.getParent().getId());
        } else {
            return this.taskParentId;
        }
    }
}
