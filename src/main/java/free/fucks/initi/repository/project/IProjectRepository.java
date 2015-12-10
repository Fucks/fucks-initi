package free.fucks.initi.repository.project;

import free.fucks.initi.entity.project.Project;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
public interface IProjectRepository extends JpaRepository<Project, Long> {

    @Query("SELECT project FROM Project project "
            + "WHERE ( (LOWER(project.name) LIKE '%' || LOWER(CAST(:filter AS string)) || '%' OR :filter = NULL ) "
            + "OR (LOWER(project.description) LIKE '%' || LOWER(CAST(:filter AS string)) || '%' OR :filter = NULL ))")
    public Page<Project> listByParam(@Param("filter") String filter, Pageable pageable);
}
