package free.fucks.initi.web.controller;

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

    @RequestMapping(value = "/")
    public ModelAndView getDefault() {
        return home();
    }

    @RequestMapping("/home")
    public ModelAndView home() {
        return new ModelAndView("modules/home/ui/index");
    }

    @RequestMapping("/user-module")
    public ModelAndView createUser() {
        return new ModelAndView("modules/user/ui/index");
    }
    
    @RequestMapping("/projeto")
    public ModelAndView project() {
        return new ModelAndView("modules/project/project/ui/index");
    }
    
    @RequestMapping("/cronograma")
    public ModelAndView cronograma() {
        return new ModelAndView("modules/cronograma/ui/index");
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        return new ModelAndView("modules/login/ui/index");
    }

    @RequestMapping("/403")
    public ModelAndView accessDenied() {
        return new ModelAndView("403");
    }

    @RequestMapping("/404")
    public ModelAndView resourceNotFound() {
        return new ModelAndView("404");
    }

}
