package free.fucks.initi.repository.project;

import free.fucks.initi.entity.project.Task;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 07/12/2015
 */
public interface ITaskRepository extends JpaRepository<Task, Long> {

    public List<Task> findByProjectId(Long projectId);
    
    public List<Task> findByParentIdOrderByProjectIndex(Long parentId);
    
    @Query(value = "SELECT task FROM Task task "
            + "WHERE task.level = 0 "
            + "AND task.project.id = :projectId")
    public Task findTaskParentByProjectId(@Param("projectId") Long projectId);
}
