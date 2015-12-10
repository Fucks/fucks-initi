package free.fucks.initi.service.project;

import free.fucks.initi.entity.account.Profile;
import free.fucks.initi.entity.account.User;
import free.fucks.initi.entity.project.Assing;
import free.fucks.initi.entity.project.Project;
import free.fucks.initi.entity.project.Resource;
import free.fucks.initi.entity.project.Task;
import free.fucks.initi.entity.project.TaskStatus;
import free.fucks.initi.repository.project.IProjectRepository;
import free.fucks.initi.repository.project.IResourceRepository;
import free.fucks.initi.repository.project.ITaskRepository;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 09/12/2015
 */
@Service
@Transactional
public class ProjectService {

    @Autowired
    private IProjectRepository projectRepository;

    @Autowired
    private IResourceRepository resourceRepository;

    @Autowired
    private ITaskRepository taskRepository;

    //PROJECT
    /**
     * Lista os projetos paginando e filtrando por nome e descrição.
     *
     * @param filter
     * @param pageable
     * @return
     */
    public Page<Project> listByParams(String filter, Pageable pageable) {
        return this.projectRepository.listByParam(filter, pageable);
    }

    /**
     * Busca um projeto pelo ID fornecido.
     *
     * @param id
     * @return
     */
    public Project findById(Long id) {
        final Project project = this.projectRepository.findOne(id);

        //popula as tasks do projeto
        project.setTasks(new ArrayList<Task>());

        final Task parentTask = this.taskRepository.findTaskParentByProjectId(project.getId());
        project.getTasks().add(parentTask);

        this.createProjectTree(project, parentTask);

        //retorna o projeto montado
        return project;
    }

    /**
     * Cria um novo projeto
     *
     * @param project
     * @return
     */
    public Project insert(Project project) {
        //Data de inicio e fim da atividade
        Calendar start = Calendar.getInstance();
        Calendar end = Calendar.getInstance();

        //adiciona 1 dia ao final
        end.add(Calendar.DATE, 1);

        //obtém o usuário logado
        final User userLogged = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        //salva o projeto
        project.setRoles(new ArrayList<Profile>());
        project.setStartDate(start.getTime());
        project.setCanWrite(true);
        project.setCanWriteOnParent(true);

        project = this.projectRepository.save(project);

        //cria uma task para o projeto
        final Task projectTask = new Task(project.getName(), "1", 0, TaskStatus.STATUS_ACTIVE, start.getTime(), end.getTime(), Boolean.TRUE, Boolean.FALSE, new ArrayList<Assing>(), "", "", 0, 1, project, null, Boolean.TRUE);
        projectTask.setProjectIndex(0);
        
        //adiciona a task
        this.taskRepository.save(projectTask);

        //adiciona o usuário como recurso
        final Resource resource = new Resource();
        resource.setUser(userLogged);

        return project;
    }

    /**
     *
     * @param project
     * @return
     */
    public Project update(Project project) {
        //informa no projeto o ultimo usuário que alterou o projeto
        project.setLastUpdatedResponsible((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal());

        //salva os recursos
//        project.setResources(this.resourceRepository.save(project.getResources()));
        //salva as tasks
        final List<Task> projectTasks = project.getTasks();
        project.setTasks(new ArrayList<Task>());
        
        for (Task task : projectTasks) {
            task.setProject(project);

            //verifica se tem pai e salva
            if (task.getTaskParentId() != null && !task.getTaskParentId().isEmpty()) {
                Task parent = this.findByInprojectIdInTasks(projectTasks, task.getTaskParentId());
                task.setParent(parent);
            }

            task = this.taskRepository.save(task);
        }

        this.taskRepository.save(projectTasks);

        this.projectRepository.save(project);

        return project;
    }

    /**
     *
     * @param project
     * @param task
     */
    public void createProjectTree(final Project project, final Task task) {

        final List<Task> childrens = this.taskRepository.findByParentIdOrderByProjectIndex(task.getId());

        if (!childrens.isEmpty()) {
            task.setHasChild(Boolean.TRUE);

            int index = project.getTasks().indexOf(task) + 1;

            project.getTasks().addAll(index, childrens);

            for (Task child : childrens) {
                this.createProjectTree(project, child);
            }
        } else {
            return;
        }
    }

    /**
     * Procura na lista de tasks a que possui o atributo inprojectId informado
     *
     * @param tasks
     * @return
     */
    public Task findByInprojectIdInTasks(final List<Task> tasks, final String inprojectId) {
        for (Task task : tasks) {
            if (task.getInprojectId().equals(inprojectId)) {
                return task;
            }
        }
        return null;
    }
}
