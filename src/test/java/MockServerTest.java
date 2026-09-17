import io.karatelabs.core.MockServer;
import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class MockServerTest {

    @Test
    void testPaymentWithMockAccountService() {

        MockServer server = MockServer
                .feature("classpath:mocks/account-service-mock.feature")
                .start();

        try {

            String accountServiceUrl = server.getUrl();

            System.out.println("Mock Account Service: " + accountServiceUrl);

            SuiteResult result = Runner.path(
                            "classpath:users/payment-with-account-mock.feature")
                    .systemProperty("accountServiceUrl", accountServiceUrl)
                    .parallel(1);

            assertEquals(
                    0,
                    result.getScenarioFailedCount(),
                    String.join("\n", result.getErrors())
            );

        } finally {
            server.stopAndWait();
        }
    }
}
