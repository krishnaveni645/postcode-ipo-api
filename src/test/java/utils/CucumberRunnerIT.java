package utils;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import io.cucumber.spring.CucumberContextConfiguration;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberContextConfiguration
@CucumberOptions(
        plugin = {"pretty", "json:target/test-reports/cucumber-reports/json-reports/postcode-ipo-api.json"},
        features = "src/test/resources/features",
        snippets = CucumberOptions.SnippetType.CAMELCASE,
        glue = "src/test/java/stepdefs",
        tags = "@ukspf and (not @skip)",
        dryRun = false)
public class CucumberRunnerIT {
}
