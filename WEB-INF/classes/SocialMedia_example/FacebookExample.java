package SocialMedia_example;

import org.scribe.builder.*;
import org.scribe.builder.api.*;
import org.scribe.model.*;
import org.scribe.oauth.*;

public class FacebookExample
{
    private static final String NETWORK_NAME = "Facebook";
    private static final String SCOPE = "basic_info,email,user_about_me";
    private static final String PROTECTED_RESOURCE_URL = "https://graph.facebook.com/me";
    private static final Token EMPTY_TOKEN = null;

    // Replace these with your own api key and secret
    String apiKey = "116428780255";// old value : "219505021398161"
    String apiSecret = "8f75ecf2a7c36ad431cc5a146dd8a6b5"; // old value : "df0a196565449cddb0dc7a62c81deec3"

    //static Token requestToken;
    static Token accessToken;

    org.apache.log4j.Logger cat = org.apache.log4j.Logger.getLogger("FacebookExample.class");

    public String initializeScribe()
    {
        OAuthService service = new ServiceBuilder()
                                      .provider(FacebookApi.class)
                                      .apiKey(apiKey)
                                      .apiSecret(apiSecret)
                                      .scope(SCOPE)
                                      .callback("https://www.freelancing.gr/index.jsp?link=chooseregrole&media=facebook")
                                      .build();

        cat.info("=== " + NETWORK_NAME + "'s OAuth Workflow ===");

        //Obtain Request Token
        //requestToken = service.getRequestToken();
        // Obtain the Authorization URL
        cat.info("Fetching the Authorization URL...");
        String authorizationUrl = service.getAuthorizationUrl(EMPTY_TOKEN);
        cat.info("Got the Authorization URL!");
        cat.info("Now go and authorize Scribe here:");
        cat.info(authorizationUrl);
        cat.info("And paste the authorization code here");
        System.out.print(">>");

        return authorizationUrl;
    }

    public String getResponce( String theverifier )
    {
        OAuthService service = new ServiceBuilder()
                                      .provider(FacebookApi.class)
                                      .apiKey(apiKey)
                                      .apiSecret(apiSecret)
                                      .scope(SCOPE)
                                      .callback("https://www.freelancing.gr/index.jsp?link=chooseregrole&media=facebook")
                                      .build();

        Verifier verifier = new Verifier(theverifier);

        // Trade the Request Token and Verfier for the Access Token
         cat.info("Trading the Request Token for an Access Token...");
        accessToken = service.getAccessToken(EMPTY_TOKEN, verifier);
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

    public String getPicture( String username ) {

        OAuthService service = new ServiceBuilder()
                                      .provider(FacebookApi.class)
                                      .apiKey(apiKey)
                                      .apiSecret(apiSecret)
                                      .callback("https://www.freelancing.gr/index.jsp?link=chooseregrole&media=facebook")
                                      .build();

        cat.info("Access token: " + accessToken);
        // Now let's go and ask for a protected resource!
        cat.info("Now we're going to access a protected resource...");
        OAuthRequest request = new OAuthRequest(Verb.GET, "https://graph.facebook.com/" + username + "/picture?redirect=false&type=normal");
        service.signRequest(accessToken, request);
        Response response = request.send();
        cat.info("Got the picture json! Lets see what we found...");

        cat.info(response.getCode());
        cat.info(response.getBody());

        cat.info("Thats it man! Go and build something awesome with Scribe! :)");

        return response.getBody();
    }

    public String getAccessToken()
    {
        return  accessToken.getToken();
    }
}