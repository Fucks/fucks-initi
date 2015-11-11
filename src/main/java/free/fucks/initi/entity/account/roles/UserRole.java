package free.fucks.initi.entity.account.roles;

import org.springframework.security.core.GrantedAuthority;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
public enum UserRole implements GrantedAuthority {

    
    ROLE_USER("Usuário"),
    ROLE_ADMIN("Administrador");

    private final String il18n;

    private UserRole(String il18n) {
        this.il18n = il18n;
    }

    @Override
    public String getAuthority() {
        return this.il18n;
    }

}
