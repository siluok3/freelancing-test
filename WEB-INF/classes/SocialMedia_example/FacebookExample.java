package SocialMedia_example;

import java.util.*;

import org.scribe.builder.*;
import org.scribe.builder.api.*;
import org.scribe.model.*;
import org.scribe.oauth.*;

public class FacebookExample {
    private static final String NETWORK_NAME = "Facebook";
    private static final String PROTECTED_RESOURCE_URL = "https://graph.facebook.com/me";
    private static final Token EMPTY_TOKEN = null;
    static Token requestToken;
    org.apache.log4j.Logger cat = org.apache.log4j.Logger.getLogger("FacebookExample.class");
    String apiKey = "219505021398161";
    String apiSecret = "df0a196565449cddb0dc7a62c81deec3";

    public String initializeScribe() {

        // Replace these with your own api key and secret

        OAuthService service = new ServiceBuilder()
                .provider(FacebookApi.class)
                .apiKey(apiKey)
                .apiSecret(apiSecret)
                .callback("http://www.freelancing.gr/index.jsp?link=chooseregrole")
                .build();
        Scanner in = new Scanner(System.in);

        cat.info("=== " + NETWORK_NAME + "'s OAuth Workflow ===");

        // Obtain the Authorization URL
        cat.info("Fetching the Authorization URL...");
        String authorizationUrl = service.getAuthorizationUrl(EMPTY_TOKEN);
        cat.info("Got the Authorization URL!");
        cat.info("Now go and authorize Scribe here:");
        cat.info(authorizationUrl);
        cat.info("And paste the authorization code here");
        return authorizationUrl;
    }

    public String getResponce(String theverifier) {
        OAuthService service = new ServiceBuilder()
                .provider(FacebookApi.class)
                .apiKey(apiKey)
                .apiSecret(apiSecret)
                .callback("http://www.freelancing.gr/index.jsp?link=chooseregrole")
                .build();
        Scanner in = new Scanner(System.in);
        Verifier verifier = new Verifier(in.nextLine());
        // Trade the Request Token and Verfier for the Access Token
        cat.info("Trading the Request Token for an Access Token...");
        Token accessToken = service.getAccessToken(EMPTY_TOKEN, verifier);
        cat.info("Got the Access Token!");
        cat.info("(if your curious it looks like this: " + accessToken + " )");

        // Now let's go and ask for a protected resource!
        cat.info("Now we're going to access a protected resource...");
        OAuthRequest request = new OAuthRequest(Verb.GET, PROTECTED_RESOURCE_URL);
        service.signRequest(accessToken, request);
        Response response = request.send();
        cat.info("Got it! Lets see what we found...");
        cat.info(response.getCode());
        cat.info(response.getBody());
        cat.info("Thats it man! Go and build something awesome with Scribe! :)");
        return response.getBody();
    }
}
