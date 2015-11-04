package free.fucks.initi.web.controller;

import free.fucks.initi.entity.account.User;
import free.fucks.initi.service.AccountService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private AccountService accountService;

    /**
     *
     * @param user
     */
    @RequestMapping(value = "/create",method = RequestMethod.POST)
    public void createUser(@RequestBody User user) {
        this.accountService.insert(user);
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public @ResponseBody
    List<User> listAllUsers() {
        return this.accountService.listAll();
    }
    
    /**
     *
     * @return
     */
    @RequestMapping(value = "/list_error",method = RequestMethod.GET)
    public @ResponseBody
    List<User> listAllUsersWithError() throws Exception {
        
        throw new Exception("Aqui da erro seu cuzão");
    }
}
