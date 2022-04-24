package responsemodels;

import lombok.Builder;
import lombok.Builder.Default;
import lombok.Getter;

@Builder
@Getter
public class DefaultError {
    @Default
    private final String status = "400";
    @Default
    private final String timestamp = "2021-10-11T12:49:48.206+00:00";
    @Default
    private final String error = "error";
    @Default
    private final String path = "/register";
}