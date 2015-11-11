/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package free.fucks.initi.config.data;

import java.util.Locale;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.core.annotation.Order;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Component;

/**
 *
 * @author Fucks
 */
@Component
@Order(5)
@Aspect
public class ExceptionPointCut {

    private final Logger LOG = Logger.getLogger(Exception.class);
    
    //SQLState to duplicated data field.
    public final String DUPLICATED_REGISTER_ERROR = "23505";

    @Autowired
    @Qualifier("fieldsMessageSource")
    private MessageSource fieldsMessageSource;

    /**
     * 
     * @param joinPoint
     * @return
     * @throws Throwable 
     */
    @Around("execution(* free.fucks.initi.service.*.insert*(..)) || "
            + "execution(* free.fucks.initi.service.*.update*(..)) || "
            + "execution(* free.fucks.initi.service.*.save*(..))")
    public Object doHandleDataIntegrityViolationException(ProceedingJoinPoint joinPoint) throws Throwable {
        try {
            LOG.info("------> Caiu no ASPECT!");
            return joinPoint.proceed();
        } catch (DataIntegrityViolationException exception) {
            if (exception.getMostSpecificCause() instanceof PSQLException) {
                PSQLException currentException = (PSQLException) exception.getMostSpecificCause();

                if (currentException.getSQLState().equals(this.DUPLICATED_REGISTER_ERROR)) {
                    //manipula a string de exception para pegar o nome do campo duplicado e 
                    //gerar uma exception com uma mensagem mais amigavel ao usuário final.
                    int start = currentException.getServerErrorMessage().getDetail().indexOf("Key (") + 5;
                    int end = currentException.getServerErrorMessage().getDetail().indexOf(")=(");

                    String fieldError = currentException.getServerErrorMessage().getDetail().substring(start, end);

                    throw new DataIntegrityViolationException("O campo " + fieldsMessageSource.getMessage(fieldError, null, Locale.getDefault()) + " já existe.");
                }
            }
        }
        return null;
    }
}