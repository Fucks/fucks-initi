package free.fucks.initi.service;

import free.fucks.initi.entity.account.User;
import free.fucks.initi.repository.IAccountRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@Service
@Transactional
public class AccountService {

    @Autowired
    private IAccountRepository accountRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    /**
     * 
     * @param user
     * @return 
     */
    public User insert(User user){
        String password = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(password);

        return this.accountRepository.save(user);
    }
    
    /**
     * 
     * @return 
     */
    @Transactional(readOnly = true)
    public List<User> listAll(){
        return this.accountRepository.findAll();
    }
    
    /**
     * 
     * @param username
     * @return 
     */
    public User findUserByUsername(String username){
        return this.accountRepository.findUserByUsername(username);
    }
}
