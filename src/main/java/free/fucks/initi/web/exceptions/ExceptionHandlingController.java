package free.fucks.initi.web.exceptions;

import javax.servlet.http.HttpServletRequest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.InvalidDataAccessResourceUsageException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
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

    public final String DUPLICATED_REGISTER_ERROR = "duplicate key value violates unique constraint";

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handleError(HttpServletRequest req, Exception exception) {

        exception.printStackTrace();
        
        ModelAndView mav = new ModelAndView("500");
        mav.addObject("exception", exception.getMessage());

        return mav;
    }

    /**
     * Handling exceptions de dados invalidos na persistencia de objetos.
     *
     * @param req
     * @param exception
     * @return
     */
    @ExceptionHandler(InvalidDataAccessResourceUsageException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handleInvalidDataErrors(HttpServletRequest req, InvalidDataAccessResourceUsageException exception) {

        return new ModelAndView("500");
    }

    /**
     * Handling exceptions de Constrainsts
     *
     * @param req
     * @param exception
     * @return
     */
    @ExceptionHandler(DataIntegrityViolationException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public @ResponseBody
    Exception handleInvalidConstraintErrors(HttpServletRequest req, DataIntegrityViolationException exception) {

        if (exception.getMostSpecificCause().getMessage().contains(DUPLICATED_REGISTER_ERROR)) {

            int start = exception.getMostSpecificCause().getMessage().indexOf("Detalhe: Key (") + 14;
            int end = exception.getMostSpecificCause().getMessage().indexOf(")=(");

            String fieldError = exception.getMostSpecificCause().getMessage().substring(start, end);

            return new Exception(fieldError + " já existe.");
        }

        return exception;
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
