package stepdefs;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import responsemodels.DefaultError;
import utils.RequestHeaders;

import static io.restassured.RestAssured.given;
import static net.javacrumbs.jsonunit.assertj.JsonAssertions.assertThatJson;
import static org.assertj.core.api.Assertions.assertThat;


import static io.restassured.RestAssured.given;

public class PostCodeSteps {
    private final RequestHeaders requestHeaders = new RequestHeaders();
    private Response response = null;

    @Given("I set GET api endpoint {string}")
    public void iSetGETApiEndpoint(final String endpoint) {

        response = given()
                .headers(new Headers(requestHeaders))
                .get(endpoint);
    }

    @When("I Set HEADER param request content type as {string}")
    public void iSetHEADERParamRequestContentTypeAs(final String contentType) {
        assertThatJson(response.getHeaders()).isEqualTo(contentType);
    }

    @Then("I receive valid HTTP response code {int}")
    public void iReceiveValidHTTPResponseCode(final int expectedStatusCode) {
        assertThat(response.getStatusCode()).isEqualTo(expectedStatusCode);
    }

    @And("a {string} error is returned in the custom error response")
    public void aErrorIsReturnedInTheCustomErrorResponse(String errorMessage) {
        final DefaultError defaultError = response
                .then()
                .extract()
                .as(DefaultError.class);

        assertThat(defaultError.getError()).isEqualTo(errorMessage);
    }
}

