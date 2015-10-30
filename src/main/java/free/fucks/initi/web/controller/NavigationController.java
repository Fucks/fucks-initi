package free.fucks.initi.web.controller;

import free.fucks.initi.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@Controller
public class NavigationController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/home")
    public ModelAndView home() {
        return new ModelAndView("home");
    }
    
    @RequestMapping("/new-user")
    public ModelAndView createUser(){
        return new ModelAndView("form");
    }
    
    @RequestMapping("/login")
    public ModelAndView login(){
        return new ModelAndView("login");
    }
    
    @RequestMapping("/403")
    public ModelAndView accessDenied(){
        return new ModelAndView("403");
    }

}
