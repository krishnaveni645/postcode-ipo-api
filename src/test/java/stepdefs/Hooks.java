package stepdefs;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.restassured.RestAssured;
import io.restassured.parsing.Parser;

public class Hooks {

    @Before
    public void onTestStart() {
        RestAssured.baseURI = "http://grant-application-api";
        RestAssured.defaultParser = Parser.JSON;

    }

    @After
    public void onTestFinish() {

    }
}