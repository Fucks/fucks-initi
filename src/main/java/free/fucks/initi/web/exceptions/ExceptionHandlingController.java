package free.fucks.initi.web.exceptions;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 04/11/2015
 */
@ControllerAdvice("free.fucks.initi.web.controller")
public class ExceptionHandlingController {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handleError(HttpServletRequest req, Exception exception) {

        ModelAndView mav = new ModelAndView("500");
        mav.addObject("exception", exception.getMessage());

        return mav;
    }

    /**
     * 
     * @param ex
     * @return 
     */
    @ExceptionHandler(NoSuchRequestHandlingMethodException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handleException(NoSuchRequestHandlingMethodException ex) {
        ModelAndView mav = new ModelAndView("404");
        return mav;
    }

    /**
     * 
     * @param ex
     * @return 
     */
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handleExceptiond(NoHandlerFoundException ex) {
        ModelAndView mav = new ModelAndView("404");
        return mav;
    }

}
