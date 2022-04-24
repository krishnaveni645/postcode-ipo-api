package utils;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import io.cucumber.spring.CucumberContextConfiguration;
import io.restassured.http.Header;
import org.junit.runner.RunWith;

import java.util.ArrayList;

public class RequestHeaders extends ArrayList<Header> {

    public void addHeader(final String key, final String value) {
        final Header header = new Header(key, value);
        super.add(header);
    }

    public void removeHeadersByKey(final String key) {
        super.removeIf(header -> header.getName().equalsIgnoreCase(key));
    }

}

