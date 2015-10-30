package free.fucks.initi.config.security;

import free.fucks.initi.entity.account.User;
import free.fucks.initi.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
@Service
public class AuthenticationService implements UserDetailsService {

    @Autowired
    private AccountService accountService;
    
    /**
     * 
     * @param string
     * @return
     * @throws UsernameNotFoundException 
     */
    @Override
    public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {
        User authenticationUser = this.accountService.findUserByUsername(string);
        
        if(authenticationUser.getId() == null){
            throw new UsernameNotFoundException("Usuário não encontrado");
        }
        
        return authenticationUser;
    }
    
}
