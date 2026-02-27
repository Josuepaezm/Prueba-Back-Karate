package back;

import com.intuit.karate.junit5.Karate;

class PaginaTest {
    @Karate.Test
    Karate testPagina() {
        return Karate.run("pagina").relativeTo(getClass());
    }

}