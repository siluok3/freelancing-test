package SocialMedia_example;

import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.GoogleApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;

public class GoogleExample
{
    private static final String NETWORK_NAME = "Google";
    private static final String PROTECTED_RESOURCE_URL = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json";
    private static final String SCOPE = "https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email";
    private static final Token EMPTY_TOKEN = null;

    /* TODO: Put your own API key, secret, and callback URL here. */
    String apiKey = "162935401134-7riuhbp78ousbh65n3899sj8mh39i3sl.apps.googleusercontent.com";//"162935401134.apps.googleusercontent.com";
    String apiSecret = "3qtZwTxhaMfQed-6pKRRGfuJ";//"PqFAj_jxdIumN_lsguKxGHXe";
    String callbackUrl = "https://freelancing.gr/index.jsp?link=chooseregrole&media=google";

    static Token requestToken;
    static Token accessToken;
    
    org.apache.log4j.Logger cat = org.apache.log4j.Logger.getLogger("GoogleExample.class");

    public String initializeScribe()
    {
            OAuthService service = new ServiceBuilder()
                    .provider(GoogleApi.class)
                    .apiKey(apiKey)
                    .apiSecret(apiSecret)
                    .callback(callbackUrl)
                    .scope(SCOPE)
                    .build();

            cat.info("=== " + NETWORK_NAME + "'s OAuth Workflow ===");

            //Obtain request token
            requestToken = service.getRequestToken();
            // Obtain the Authorization URL
            cat.info("Fetching the Authorization URL...");
            String authorizationUrl = service.getAuthorizationUrl(requestToken);
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
                .provider(GoogleApi.class)
                .apiKey(apiKey)
                .apiSecret(apiSecret)
                .callback(callbackUrl)
                .scope(SCOPE)
                .build();

        Verifier verifier = new Verifier(theverifier);

        // Trade the Request Token and Verfier for the Access Token
        cat.info("Trading the Request Token for an Access Token...");
        accessToken = service.getAccessToken(requestToken, verifier);
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

    public String getAccessToken()
    {
        return  accessToken.getToken();
    }
}