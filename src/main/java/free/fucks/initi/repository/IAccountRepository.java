package free.fucks.initi.repository;

import free.fucks.initi.entity.account.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
public interface IAccountRepository extends JpaRepository<User, Long>{

    public User findUserByUsername(String username);
}
