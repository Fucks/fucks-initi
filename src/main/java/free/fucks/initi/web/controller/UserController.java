package free.fucks.initi.web.controller;

import free.fucks.initi.entity.account.User;
import free.fucks.initi.service.AccountService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
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
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public void createUser(@RequestBody User user) throws Exception {
        this.accountService.save(user);
    }
    
    /**
     * 
     * @param user
     * @throws Exception 
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateUser(@RequestBody User user) throws Exception {
        this.accountService.save(user);
    }

    /**
     *
     * @param users
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public void remove(@RequestBody List<User> users) {
        this.accountService.delete(users);
    }

    /**
     *
     * @param filter
     * @param page
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody
    Page<User> listUsersByParams(@RequestParam("filter") String filter, Pageable page) {
        return this.accountService.listByParams(filter, page);
    }

    /**
     * 
     * @param id
     * @return 
     */
    @RequestMapping(value = "/find", method = RequestMethod.GET)
    public @ResponseBody
    User findUser(@RequestParam("id") Long id) {
        return this.accountService.findById(id);
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/list_error", method = RequestMethod.GET)
    public @ResponseBody
    List<User> listAllUsersWithError() throws Exception {

        throw new Exception("Aqui da erro seu cuzão");
    }
}
