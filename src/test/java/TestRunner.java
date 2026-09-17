import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

class TestRunner {

    @Test
    void runAllTests() {
        var result = Runner.path("classpath:")
                .outputHtmlReport(true)
                .tags("~@mock")
                .parallel(5);

        assertTrue(result.isPassed());
    }
}