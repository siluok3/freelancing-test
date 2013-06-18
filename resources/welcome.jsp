<%@ page language="java" import="java.util.*,mybeans.*" %>
<%@ page import="engine.EshopQueryEngine" %>
<%@ page import="java.text.ParseException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="mybeans.User" scope="session"/>
<jsp:useBean id="projectbidsmanagment" class="engine.ProjectBidsManagment" scope="page"/>
<jsp:useBean id="usman" class="engine.UserManagement" scope="page"/>
<jsp:useBean id="emailmsg" class="engine.EmailCampaign" scope="page"/>
<%@ taglib prefix="a" uri="http://jmaki/v1.0/jsp" %>
<jsp:useBean id="rpmanagment" class="engine.RunningProjectsManagement" scope="page"/>

<%--<%@page import="util.UAgentInfo"%>--%>

<%
    //2. Initialize the browser info variables
    //String userAgent = request.getHeader("User-Agent");
    // String httpAccept = request.getHeader("Accept");

    //3. Create the UAgentInfo object
    // UAgentInfo detector = new UAgentInfo(userAgent, httpAccept);

    //4. Detect whether the visitor is using a mobile device.
    //   For example, if it's an iPhone, redirect them to the
    //   iPhone-optimized version of your web site.
    // if (detector.detectIphoneOrIpod()||(detector.detectTierIphone()||(detector.detectTierOtherPhones()))) {
    //    response.sendRedirect("http://www.freelancing.gr/touchsite/login.jsp");
    // }
%>

<% org.apache.log4j.Logger cat = org.apache.log4j.Logger.getLogger("welcomenew.jsp");
    HttpSession session1 = request.getSession();

    String landing = request.getParameter("landing");
    if (landing != null) {
        session1.setAttribute("landing", landing);
    }
    landing = (String) session1.getAttribute("landing");
    if (landing == null) {
        landing = "buyer";
    }

    String path = request.getQueryString();
    String lang = request.getParameter("lang");
    if (lang == null) {
        lang = (String) session1.getAttribute("lang");
    } else {
        session1.setAttribute("lang", lang);
    }
    if (lang == null) {
        lang = "en";
        session1.setAttribute("lang", lang);
    }
    String link = (String) session1.getAttribute("link");

    String statisticsfrom = request.getParameter("from");   //this parameter comes from links of ads or emails from which we want to keep statistics for incoming users

    if (statisticsfrom != null) {
        try {
            usman.updateStatisticsTableHits(statisticsfrom);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        session1.setAttribute("from", statisticsfrom);
    } else {
        statisticsfrom = (String) session1.getAttribute("from");
    }


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" >-->
<head>
    <base href="http://localhost:8080/freelancing/"/>
    <title> The freelancers collaboration site -<%if (landing.equals("buyer")) {%> Welcome Buyer <%} else {%> Welcome
        Provider <%}%></title>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="keywords"
          content="freelancing , freelancer , web design , web development , outsourcing , ecommerce , web 2.0 , AJAX , community , Java , J2EE , soa , javascript , e-shop application, Programmer , Προγραμματιστής , free , Θεσσαλονίκη, Open Source , Ανοιχτός κώδικας"/>
    <%if (lang.equalsIgnoreCase("en")) {%>
    <meta name="description" content="Co-operative environment for freelancers developed to deliver outsourcing solutions on web design/development and hosting
, e-commerce solutions and Web 2.0 applications using rapid-development techniques on Java, J2EE, Ajax and other technologies in an good old fashioned personal way and a value for money."/>
    <%} else {%>
    <meta name="description"
          content="Η freelancing.gr είναι δικτυακός τόπος συνάντησης freelancers που ειδικεύεται στο σχεδιασμό και την ανάπτυξη διαδικτυακών εφαρμογών, Web 2.0 και e-commerce εφαρμογών χρησιμοποιώντας τεχνικές ταχείας ανάπτυξης σε  Java, J2EE, Ajax και άλλες τεχνολογίες. Παρέχει επίσης συμπληρωματικές υπηρεσίες web hosting, media streaming και web marketing."/>
    <%}%>
    <link rel="stylesheet" href="reset.css" type="text/css"/>
    <link rel="stylesheet" href="stylesheet.css" type="text/css"/>
    <link rel="stylesheet" href="css/slider/style.css" type="text/css"/>

    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="icon" href="animated_favicon1.gif" type="image/gif"/>
    <script type="text/javascript" src="content-selection.js"></script>
    <script type="text/javascript"> var _siteRoot = 'welcome.jsp',_root = 'welcome.jsp';</script>
    <script type="text/javascript" src="js/slider/jquery.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript" src="js/ie6.js"></script>
    <%--<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>  --%><%--FLASH--%>

    <!--<script language="JavaScript" type="text/javascript" src="js/Snow_Fall.js"></script>-->

</head>
<body>
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://" : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-4927753-1");
    pageTracker._trackPageview();
</script>

<script type="text/javascript">
    function pw() {
        return window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth
    }
    ;
    function mouseX(evt) {
        return evt.clientX ? evt.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft) : evt.pageX;
    }
    function mouseY(evt) {
        return evt.clientY ? evt.clientY + (document.documentElement.scrollTop || document.body.scrollTop) : evt.pageY
    }
    function popUp(evt, oi) {
        if (document.getElementById) {
            var wp = pw();
            dm = document.getElementById(oi);
            ds = dm.style;
            st = ds.visibility;
            if (dm.offsetWidth) ew = dm.offsetWidth; else if (dm.clip.width) ew = dm.clip.width;
            if (st == "visible" || st == "show") {
                ds.visibility = "hidden";
            }
            else {
                tv = mouseY(evt) + 20;
                lv = mouseX(evt) - (ew / 4);
                if (lv < 2) lv = 2; else if (lv + ew > wp) lv -= ew / 2;
                lv += 'px';
                tv += 'px';
                ds.left = lv;
                ds.top = tv;
                ds.visibility = "visible";
            }
        }
    }
</script>
<div id="pagewidth">
<div id="links">
    <div id="links_wrapper">

        <%--<div id="language_selection">--%>
        <%--<%if (lang.equals("en")){%>--%>
        <%--<form name="grform" id="grform" method="post" action="<%=response.encodeRedirectURL("invalidates")%>" >--%>
        <%--<fieldset>--%>
        <%--<input type="hidden" name="lang" value="gr"/>--%>
        <%--<input type="hidden" name="path" value="<%=path%>"/>--%>
        <%--<p style="width:200px">Μήπως προτιμάτε τα <a  href="#" onclick="document['grform'].submit()">Ελληνικά;</a></p><a  href="#" onclick="document['grform'].submit()"><img src="images/gr.jpeg" alt="" height="17" style="padding:0"> </a>--%>
        <%--</fieldset>--%>
        <%--</form>--%>
        <%--<%}else{%>--%>
        <%--<form name="enform" id="enform" method="post" action="<%=response.encodeRedirectURL("invalidates")%>" >--%>
        <%--<fieldset>--%>
        <%--<input type="hidden" name="lang" value="en"/>--%>
        <%--<input type="hidden" name="path" value="<%=path%>"/>--%>
        <%--<p style="width:165px">Do you prefer in <a href="#" onclick="document['enform'].submit()">English?</a></p><a href="#" onclick="document['enform'].submit()"><img src="images/uk.jpeg" alt="" height="17" style="padding:0"></a>--%>
        <%--</fieldset>--%>
        <%--</form>--%>
        <%--<%}%>--%>
        <%--</div>--%>

        <div id="language_selection">
            <%if (lang.equals("en")) {%>

            <p>Μήπως προτιμάτε τα <a href="<%= response.encodeURL("welcome.jsp?lang=gr")%>">Ελληνικά;</a></p>

            <%} else {%>

            <p>Do you prefer in <a href="<%= response.encodeURL("welcome.jsp?lang=en")%>">English?</a></p>
            <%--<p>Do you prefer in  <a href="<%= response.encodeURL("index.jsp?link="+link+"&lang=en")%>">English</a></p>--%>

            <%}%>
        </div>

        <%if (lang.equals("en")) {%>
        <ul id="navigation_new">
            <!--<li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=homepage")%>">Posted Projects</a> |</li>-->
            <li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=freeabout")%>">About us</a> |</li>
            <li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=latestnews")%>">Latest news</a> |</li>
            <li class="nav_new"><a href="freeway.jsp?lang=en">Advertise in FreeWay</a> |</li>
            <li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=membership")%>">Memberships</a></li>
        </ul>
        <%} else {%>
        <ul id="navigation_new">
            <!--<li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=homepage")%>">Αναρτημένα έργα</a> |</li>-->
            <li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=freeabout")%>">Σχετικά με εμάς</a> |
            </li>
            <li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=latestnews")%>">Τελευταία νέα</a> |</li>
            <li class="nav_new"><a href="freeway.jsp?lang=gr">Διαφημιστείτε στο FreeWay</a> |</li>
            <li class="nav_new"><a href="<%= response.encodeURL("index.jsp?link=membership")%>">Συνδρομές</a></li>
        </ul>
        <%}%>

    </div>

</div>
<div id="headertop">


<% if (user.getUserName() != null) { //xristis syndedemenos %>

<div id="header_wrapper_logged">
<div id="header_left_logged">
    <%if (lang.equals("en")) {%> <p class="h3">Welcome</p><%} else {%><p class="h3">Καλώς ήρθατε</p><%}%>
    <%if (user.getGroupID() == 5) {%>
    <p class="h1"><a
            href="<%= response.encodeURL("index.jsp?link=viewbuyerprofile&buyerid="+user.getUserID())%>"><%=user.getFirstname()%>
    </a></p>
    <%} else {%>
    <p class="h1"><a
            href="<%= response.encodeURL("index.jsp?link=viewproviderprofile&provid="+user.getUserID())%>"><%=user.getFirstname()%>
    </a></p>
    <%}%>
    <ul id="login-register">
        <li class="login-register"><a
                href="<%=response.encodeRedirectURL("logoutServlet")%>"><%if (lang.equals("en")) {%>Log
            out<%} else {%>Αποσύνδεση<%}%></a></li>
    </ul>
</div>


<div id="header_middle_b_logged">
    <h1><a href="#">www.justfreelancing.com is Freelancing - The Outsourcing Experts</a></h1><img
        src="images/tinylogo.png" alt="Logo" style="padding-left:0;padding-right:0;padding-top:10px;"/>


    <!--PAPER PIECE HEADER STARTS HERE: DO NOT ADD ANYTING HERE BECAUSE THERE IS NO SPACE LEFT FOR ANY GROUP OF USERS. ALL POSSIBLE SPACE IS USED WHEN USERS GET INVOLVED IN PROJECTS.-->

    <%if (lang.equals("gr")) {%>
    <%if (user.getGroupID() == 5) {%>
    <br/><br/>

    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>">Οθόνη
        Διαχείρισης Αγοραστή</a>

    <%} else if (user.getGroupID() == 4) {%>
    <br/><br/>

    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">Οθόνη
        Διαχείρισης Προμηθευτή</a>

    <%} else if (user.getGroupID() == 9) {%>
    <p id="help-text"><br/>
        Οθόνη διαχείρισης <br/><br/> <a class="linkButton"
                                        href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>">
            Αγοραστή</a> |
        <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
            Προμηθευτή</a>
    </p>
    <%} else if (user.getGroupID() == 3) {%>
    <p id="help-text"><br/>
        Οθόνη διαχείρισης <br/><br/><a class="linkButton"
                                       href="<%= response.encodeURL("index.jsp?link=wmmpanel/wmmlogged")%>">
            W.M.M.</a> |
        <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
            Προμηθευτή</a>
    </p>
    <%} else if (user.getGroupID() == 7) {%>
    <p id="help-text"><br/>
        Οθόνη διαχείρισης <br/><br/> <a class="ahelp_text"
                                        href="<%= response.encodeURL("index.jsp?link=partners/partnerlogged")%>">
            Partner</a> |
        <a class="ahelp_text" href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>">
            Αγοραστή</a> |
        <a class="ahelp_text" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
            Προμηθευτή</a>
    </p>
    <%} else if (user.isAdmin()) {%>
    <br/>
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=admin/adminlogged")%>"> Administrator</a> |
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=partners/partnerlogged")%>"> Partners</a> |
    <br/> <br/>
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=wmmpanel/wmmlogged")%>"> W.M.M.</a> |
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>"> Αγοραστή</a> |
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
        Προμηθευτή</a>

    <%} else {%>
    <p id="help-text"><br/>Ο λογαριασμός σου είναι απενεργοποιημενος. <br/><br/>
        <a class="ahelp_text" href="<%= response.encodeURL("index.jsp?link=users/userdetails")%>"
           title="Ενεργοποίησε το λογαριασμό σου">Ενεργοποίηση Λογαριασμού</a><br/>

    </p> <%}%>


    <%} else {%>
    <%if (user.getGroupID() == 5) {%>
    <br/><br/>
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>">Buyer
        Administration Panel</a>

    <%} else if (user.getGroupID() == 4) {%>
    <br/><br/>
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">Provider
        Administration Panel</a> <br/>

    <%} else if (user.getGroupID() == 9) {%>
    <p id="help-text"><br/>
        Administration panel<br/><br/> <a class="linkButton"
                                          href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>">
            Buyer</a> |
        <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
            Provider</a>
    </p>
    <%} else if (user.getGroupID() == 3) {%>
    <p id="help-text"><br/>
        Administration panel<br/><br/><a class="linkButton"
                                         href="<%= response.encodeURL("index.jsp?link=wmmpanel/wmmlogged")%>">
            W.M.M.</a> |
        <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
            Provider</a>
    </p>
    <%} else if (user.getGroupID() == 7) {%>
    <p id="help-text"><br/>
        Administration panel<br/><br/> <a class="linkButton"
                                          href="<%= response.encodeURL("index.jsp?link=partners/partnerlogged")%>">
            Partners</a> |
        <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>"> Buyer</a>
        |
        <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
            Provider</a>
    </p>
    <%} else if (user.isAdmin()) {%> <br/>
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=admin/adminlogged")%>"> Administrator</a> |
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=partners/partnerlogged")%>"> Partners</a> |
    <br/> <br/>
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=wmmpanel/wmmlogged")%>"> W.M.M.</a> |
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=buyerspanel/buyerslogged")%>"> Buyer</a> |
    <a class="linkButton" href="<%= response.encodeURL("index.jsp?link=providerspanel/providerlogged")%>">
        Provider</a>

    <%} else {%>
    <p id="help-text"><br/>Your account is deactivated. <br/><br/>
        <a class="ahelp_text" href="<%= response.encodeURL("index.jsp?link=users/userdetails")%>"
           title="Activate your account">Activate account</a><br/>

    </p> <%}%>

    <%}%>
    <!--PAPER PIECE HEADER ENDS HERE.-->

</div>

<!--basket for logged users-->
<%
    Vector buylist = (Vector) session.getAttribute("shopping.shoppingcart");
    int amount = 0;
    float totpr = 0;
    String price = "0.00";
    if ((buylist != null) && (buylist.size() > 0)) {
        for (int index = 0; index < buylist.size(); index++) {
            ServiceBean anOrder = (ServiceBean) buylist.elementAt(index);
            amount = amount + anOrder.getQuantity();
            totpr = totpr + (anOrder.getPrice() * anOrder.getQuantity());
        }

        price = Float.toString(totpr);
        price += 0.005;
        int n = price.indexOf('.');
        price = price.substring(0, n + 3);
    } %>
<%if (lang.equals("en")) {%>
<% if ((buylist != null) && (buylist.size() > 0)) {%>
<div id="header_right_no_img_logged">
    <a href="<%= response.encodeURL("index.jsp?link=cart")%>"><img border="0" src="images/Shopping-Cart.png"
                                                                   alt="Shopping Cart"/></a>

    <p> Total: <%= price.replace(".", ",")%> €<br/>
        <%=amount%> different item(s) </p>
</div>

<%} else {%>
<div id="header_right_no_img_logged">
    <a href="<%= response.encodeURL("index.jsp?link=catalog")%>"><img border="0" src="images/Shopping-Cart.png"
                                                                      alt="Shopping Cart"/></a>

    <p><br/><a class="anextstep" href="<%= response.encodeURL("index.jsp?link=catalog")%>">E-Shop</a></p>
</div>

<%}%>
<div id="nextstep">
    <% EshopQueryEngine eshopengine = new EshopQueryEngine();
        Vector userserv = eshopengine.getServicesForuserid(user.getUserID());
        if (userserv.size() != 0) {%>
    <br/> <a class="anextstep" href="<%= response.encodeURL("index.jsp?link=catalog&hasdue=yes")%>"> <b>Check your
    amount due</b></a>
    <%}%>
    <jsp:include page="indexviewas.jsp"/>
</div>
<div><a href="welcome.jsp?landing="></a></div>
<%} else {%>
<% if ((buylist != null) && (buylist.size() > 0)) {%>
<div id="header_right_no_img_logged">
    <a href="<%= response.encodeURL("index.jsp?link=cart")%>"><img border="0" src="images/Shopping-Cart.png"
                                                                   alt="Καλάθι Αγορών"/></a>

    <p>Σύνολο: <%= price.replace(".", ",")%> €<br/>
        <%=amount%> προϊόντα/υπηρεσίες</p>
</div>

<%} else {%>
<div id="header_right_no_img_logged">
    <a href="<%= response.encodeURL("index.jsp?link=catalog")%>"><img border="0" src="images/Shopping-Cart.png"
                                                                      alt="Καλάθι Αγορών"/></a>

    <p><br/><a class="anextstep" href="<%= response.encodeURL("index.jsp?link=catalog&hasdue=yes")%>">E-shop</a></p>
</div>

<%}%>
<div id="nextstep">
    <% EshopQueryEngine eshopengine = new EshopQueryEngine();
        Vector userserv = eshopengine.getServicesForuserid(user.getUserID());
        if (userserv.size() != 0) {%>
    <a class="anextstep" href="<%= response.encodeURL("index.jsp?link=catalog")%>"> <b>Έλεγξε τις οφειλές σου</b>
    </a>
    <%}%>
    <jsp:include page="indexviewas.jsp"/>
</div>

<%}%>

<%--the forms landingFormb2 and landingFormp2 are submitted in indexviewas.jsp--%>

<%if (landing.equals("buyer")) {%>
<form id="landingFormp2" name="landingFormp2" method="post"
      action="<%=response.encodeRedirectURL("landingChooser")%>">
    <fieldset>
        <input type="hidden" name="landing" value="provider"/>
        <input type="hidden" name="path" value="<%=path%>"/>
    </fieldset>
</form>
<%} else {%>
<form id="landingFormb2" name="landingFormb2" method="post"
      action="<%=response.encodeRedirectURL("landingChooser")%>">
    <fieldset>
        <input type="hidden" name="landing" value="buyer">
        <input type="hidden" name="path" value="<%=path%>"/>
    </fieldset>
</form>
<%}%>


</div>

<%} else {  //  user.getUserName() == null, kanenas xristis syndedemenos %>

<div id="header_wrapper">

    <div id="header_left">

        <%if (landing.equals("buyer")) {%>

        <%--<%if (lang.equals("en")){%> <p class="h3">Welcome</p> <%}else{%><p class="h3">Καλώς ήρθατε</p> <%}%>--%>
        <%if (lang.equals("en")) {%><p class="h1">Looking for <br/> Workers?</p><%} else {%><p class="h1">Προσφέρω <br/>
        Εργασία</p><%}%>
        <ul id="login-register">
            <%if (lang.equals("en")) {%>
            <li class="login-register"><a title="You must be registered in order to log in."
                                          href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Login</a>
                |
            </li>
            <li class="login-register"><a title="Register now, outsource and reduce costs."
                                          href="<%= response.encodeURL("index.jsp?link=users/buyregistration&amp;from="+statisticsfrom)%>">Register</a>
            </li>
            <%} else {%>
            <li class="login-register"><a title="Για να συνδεθείτε θα πρέπει να είστε ήδη εγγεγραμμένος."
                                          href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Σύνδεση</a>
                |
            </li>
            <li class="login-register"><a title="Εγγραφείτε ως αγοραστής και κερδίστε σε ποιότητα και οικονομία."
                                          href="<%= response.encodeURL("index.jsp?link=users/buyregistration&amp;from="+statisticsfrom)%>">Εγγραφή</a>
            </li>
            <%}%>
        </ul>
        <br/>
        <%if (lang.equals("en")) {%>
        <a href="<%= response.encodeURL("index.jsp?link=postanewproject")%>"><img src="images/Post-It-2.png"
                                                                                  alt="Post a new project" width="80"
                                                                                  height="63"/></a>
        <%} else {%>
        <a href="<%= response.encodeURL("index.jsp?link=postanewproject")%>"><img src="images/Post-It-3.png"
                                                                                  alt="Κάντε post ενα νέο έργο"
                                                                                  width="80" height="63"/></a>
        <%}%>
        <%} else {%>
        <%--<%if (lang.equals("en")){%> <p class="h3">Welcome</p> <%}else{%><p class="h3">Καλώς ήρθατε</p> <%}%>--%>
        <%if (lang.equals("en")) {%><p class="h1">Looking for <br/> Work?</p><%} else {%><p class="h1">Ψάχνω<br/>
        Eργασία</p><%}%>
        <ul id="login-register">
            <%if (lang.equals("en")) {%>
            <li class="login-register"><a title="You must be registered in order to log in."
                                          href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Login</a>
                |
            </li>
            <li class="login-register"><a title="Register here creating an attractive profile."
                                          href="<%= response.encodeURL("index.jsp?link=users/devregistrationpers&from="+statisticsfrom)%>">Register</a>
            </li>
            <%} else {%>
            <li class="login-register"><a title="Για να συνδεθείτε θα πρέπει να είστε ήδη εγγεγραμμένος"
                                          href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Σύνδεση</a>
                |
            </li>
            <li class="login-register"><a title="Εγγραφείτε δημιουργώντας ένα ελκυστικό προφίλ."
                                          href="<%= response.encodeURL("index.jsp?link=users/devregistrationpers&from="+statisticsfrom)%>">Εγγραφή</a>
            </li>
            <%}%>
        </ul>

        <form action="<%=response.encodeRedirectURL("ProjectSearchServlet")%>" method="post" name="projectsearch"
              id="projectsearch">
            <fieldset>
                <input type="text" name="search" id="search"/>
                <%if (lang.equals("en")) {%>
                <p>Search for projects
                    <a href="#" class="linkroz" onclick="document['projectsearch'].submit()"> GO </a></p>
                <%} else {%>
                <p>Ψάξτε για έργα
                    <a href="#" class="linkroz" onclick="document['projectsearch'].submit()"> GO </a></p>
                <%}%>
            </fieldset>
        </form>

        <%-- <form action="#" method="post">
                  <fieldset>
                      <input type="text" name="search"/>
                   <%if (lang.equals("en")){%><p>Search for projects</p><%}else{%><p>Ψάξτε για projects</p> <%}%>
                  </fieldset>
              </form>--%>
        <%}%>
    </div>

    <div id="header_middle">
        <%
            Vector buylist = (Vector) session.getAttribute("shopping.shoppingcart");
            int amount = 0;
            float totpr = 0;
            String price = null;
            if ((buylist != null) && (buylist.size() > 0)) {
                for (int index = 0; index < buylist.size(); index++) {
                    ServiceBean anOrder = (ServiceBean) buylist.elementAt(index);
                    amount = amount + anOrder.getQuantity();
                    totpr = totpr + (anOrder.getPrice() * anOrder.getQuantity());
                }

                price = Float.toString(totpr);
                price += 0.005;
                int n = price.indexOf('.');
                price = price.substring(0, n + 3);

            } %>

        <h1><a href="#">www.justfreelancing.com is Freelancing - The Outsourcing Experts</a></h1><a
            href="<%= response.encodeURL("welcome.jsp")%>"><img src="images/tinylogo.png" alt="Logo"
                                                                style="padding-left:0;padding-right:0;padding-top:10px;"
                                                                width="286" height="100"/></a>

        <!--<object width="351" height="116">-->
        <!--<param name="movie" value="headerflash.swf">-->
        <!--<param name="quality" value="high">-->
        <!--<embed src="headerflash.swf" width="351" height="116"  quality="high">-->
        <!--</embed>-->
        <!--</object>-->
        <!--<img src="images/Logo.jpg" alt="Logo" />-->

        <% if ((buylist != null) && (buylist.size() > 0)) {%>
        <!-- Starting basket for not logged users.It's just a p element -->
        <a href="<%= response.encodeURL("index.jsp?link=cart")%>"><p id="shopping_cart">
            <%if (lang.equals("en")) {%>
            total: <%= price.replace(".", ",")%>€<br/>
            <%=amount%> different item(s)
            <%} else {%>
            σύνολο: <%= price.replace(".", ",")%>€<br/>
            <%=amount%> προϊόν/υπηρεσία
            <%}%>
        </p><!-- and here we have the ending of the Basket Glory-->     </a>
        <%--<%}else{%>
  <p id="WeRJustFrTitle"><i>We r just freelancing</i></p>  --%>
        <%} else {%>
        <%if (lang.equals("en")) {%>
        <a href="<%= response.encodeURL("index.jsp?link=catalog")%>"><p id="shopping_cart2">E-Shop</p></a>
        <%} else {%>
        <a href="<%= response.encodeURL("index.jsp?link=catalog")%>"><p id="shopping_cart3">Κατάλογος <br/>Υπηρεσιών</p>
        </a>
        <%}%>
        <%}%>
    </div>
    <%if (landing.equals("buyer")) { //oxi syndedemenos buyer %>
    <div id="header_right_no_img">
        <%--<%if (lang.equals("en")){%> <p class="h3">Are you a</p> <%}else{%><p class="h3">Είστε</p> <%}%>--%>

        <form id="landingFormp" name="landingFormp" method="post"
              action="<%=response.encodeRedirectURL("landingChooser")%>">
            <fieldset>
                <input type="hidden" name="landing" value="provider"/>
                <input type="hidden" name="path" value="<%=path%>"/>
            </fieldset>
        </form>
        <p class="h1"><a href="#" onclick="document['landingFormp'].submit()"><%if (lang.equals("en")) {%>Looking for
            <br/> Work?<%} else {%>Ψάχνω <br/> Εργασία<%}%></a></p>
        <%--<%if (lang.equals("en")){%> <p class="h2"><a href="#" onclick="document['landingFormp'].submit()">Find work!</a></p>--%>
        <%--<%}else{%><p class="h2"><a href="#" onclick="document['landingFormp'].submit()">Βρείτε πέλατες!</a></p> <%}%>--%>
        <p class="toprightpar1"><%if (lang.equals("en")) {%>
            <a title="You must be registered in order to log in."
               href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Login</a> |
            <a title="Register here creating an attractive profile."
               href="<%= response.encodeURL("index.jsp?link=users/devregistrationpers&from="+statisticsfrom)%>">Register</a>
            <%} else {%>
            <a title="Για να συνδεθείτε θα πρέπει να είστε ήδη εγγεγραμμένος."
               href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Σύνδεση</a> |
            <a title="Εγγραφείτε δημιουργώντας ένα ελκυστικό προφίλ."
               href="<%= response.encodeURL("index.jsp?link=users/devregistrationpers&from="+statisticsfrom)%>">Εγγραφή</a>
            <%}%></p>

    </div>
    <%} else { //oxi syndedemenos provider %>
    <div id="header_right_no_img">
        <%--<%if (lang.equals("en")){%> <p class="h3">Are you a</p> <%}else{%><p class="h3">Είστε</p> <%}%>--%>

        <form id="landingFormb" name="landingFormb" method="post"
              action="<%=response.encodeRedirectURL("landingChooser")%>">
            <fieldset>
                <input type="hidden" name="landing" value="buyer">
                <input type="hidden" name="path" value="<%=path%>"/>
            </fieldset>
        </form>
        <p class="h1"><a href="#" onclick="document['landingFormb'].submit()"><%if (lang.equals("en")) {%>Looking for
            <br/> Workers?<%} else {%>Προσφέρω <br/> Εργασία<%}%></a></p>
        <%--<%if (lang.equals("en")){%>   <p class="h2"><a href="#" onclick="document['landingFormb'].submit()"> &#160;Find professionals!</a></p>--%>
        <%--<%}else{%> <p class="h2"><a href="#" onclick="document['landingFormb'].submit()">Βρείτε επαγγελματίες!</a></p> <%}%>--%>
        <p class="toprightpar2"><%if (lang.equals("en")) {%>
            <a title="You must be registered in order to log in."
               href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Login</a> |
            <a title="Register now, outsource and reduce costs."
               href="<%= response.encodeURL("index.jsp?link=users/buyregistration&from="+statisticsfrom)%>">Register</a>
            <%} else {%>
            <a title="Για να συνδεθείτε θα πρέπει να είστε ήδη εγγεγραμμένος"
               href="<%= response.encodeURL("index.jsp?link=users/member&amp;from="+statisticsfrom)%>">Σύνδεση</a> |
            <a title="Εγγραφείτε ως αγοραστής και κερδίστε σε ποιότητα και οικονομία"
               href="<%= response.encodeURL("index.jsp?link=users/buyregistration&from="+statisticsfrom)%>">Εγγραφή</a>
            <%}%></p>
    </div>
    <%}%>


</div>

<%}%>

</div>

<div id="content_background">
<div id="intro">
    <div id="introduction">
    </div>
</div>

<div id="sub_content2">
<div id="sub_wrapper2" class="clearfix">

<div id="t2" class="tip">the numbers in <span>( )</span> show the number of members - freelancers working on a
    particular skill
</div>
<div id="t1" class="tip">oι αριθμοί σε <span>( )</span> δείχνουν το πλήθος των μελών - freelancers που ασχολούνται με τη
    συγκεκριμένη εξειδίκευση
</div>


<%--<%if(landing.equals("buyer")){%>--%>
<!-- Starting Javascript -->
<%--Browse skills / freelancers--%>
<div id="leftcol_new">
<%if (lang.equals("en")) {%><h1><img src="images/title1en.png" alt="Skills/ Freelancers"><img class="imgalign"
                                                                                              src="images/info_icon.png"
                                                                                              onmouseout="popUp(event,'t2')"
                                                                                              onmouseover="popUp(event,'t2')"
                                                                                              alt="the number in ( ) is the number of members - freelancers working on this skill"
                                                                                              width="45" height="30"/>
</h1>

<%} else {%> <h1><img src="images/title1gr.png" alt="Εξειδικεύσεις/ Freelancers"><img class="imgalign"
                                                                                      onmouseout="popUp(event,'t1')"
                                                                                      onmouseover="popUp(event,'t1')"
                                                                                      src="images/info_icon.png"
                                                                                      alt="o αριθμός σε ( ) είναι ο αριθμός των μελών - freelancers που ασχολούνται με αυτή την εξειδίκευση"
                                                                                      width="45" height="30"/></h1><%}%>
<%--<%}else{%> <h1>Υπηρεσίες  <a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/thegamebanner.jsp'})"><img class="imgalign" src="images/thegameico.gif" alt="Play avec freelancing"  /></a></h1><%}%>--%>
<span class="underline"></span>

<div id="projects_selection_new">
<div id="left_content_new">

    <%if (lang.equals("en")) {%>
    <div id="menu_option_new1" class="showall_new">
        <h2>
            <a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersPrSoftDataDev.jsp'})"
               onmouseover="slotMouseOverNew(1);">Programming/Software/Database Development</a></h2>
    </div>
    <div id="menu_option_new2" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersNetPCSup.jsp'})"
               onmouseover="slotMouseOverNew(2);">Network Support</a></h2>
    </div>

    <div id="menu_option_new3" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebDD.jsp'})"
               onmouseover="slotMouseOverNew(3);">Web Development/Web Design</a></h2>
    </div>
    <div id="menu_option_new4" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersGrDMult.jsp'})"
               onmouseover="slotMouseOverNew(4);">Art & Design/New Technologies</a></h2>
    </div>
    <div id="menu_option_new5" class="hideall_new">
        <h2><a title="Web/ Press/ Media"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOverNew(5);">Marketing</a></h2>
    </div>
    <div id="menu_option_new6" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersCC.jsp'})"
               onmouseover="slotMouseOverNew(6);">Consulting-Copywriting</a></h2>
    </div>
    <div id="menu_option_new7" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersEnv.jsp'})"
               onmouseover="slotMouseOverNew(7);"><span style="color:#7db169; font-size: 14px;">Green Technology - Ecology</span></a>
        </h2>
    </div>
    <div id="menu_option_new8" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOverNew(8);">Mobile - Tablets</a></h2>
    </div>

    <div id="menu_option_new9" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOverNew(9);"><span
                style="color:#2C67A3; font-size: 14px;">Organization supplies</span></a></h2>
    </div>


    <%} else {%>
    <div id="menu_option_new1" class="showall_new">
        <h2><a title="Programming(Backend)/Software/Database Development"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/bannersjsps/bannersPrSoftDataDev.jsp'})"
               onmouseover="slotMouseOverNew(1);">Προγραμματισμός/ Βάσεις Δεδομένων</a></h2>
    </div>
    <div id="menu_option_new2" class="hideall_new">
        <h2><a title="Network Support"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/bannersjsps/bannersNetPCSup.jsp'})"
               onmouseover="slotMouseOverNew(2);">Δικτυακή Υποστήριξη</a></h2>
    </div>

    <div id="menu_option_new3" class="hideall_new">
        <h2><a title="Web Development(Frontend)/Web Design"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/bannersjsps/bannersWebDD.jsp'})"
               onmouseover="slotMouseOverNew(3);">Προγραμματισμός Διαδικτύου / Ιστοσελίδων</a></h2>
    </div>
    <div id="menu_option_new4" class="hideall_new">
        <h2><a title="Art & Design/New Technologies"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/bannersjsps/bannersGrDMult.jsp'})"
               onmouseover="slotMouseOverNew(4);">Σχέδιο/ Γραφιστική</a></h2>
    </div>
    <div id="menu_option_new5" class="hideall_new">
        <h2><a title="Marketing"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOverNew(5);">Διαδίκτυο/Προώθηση/Μάρκετινγκ</a></h2>
    </div>
    <div id="menu_option_new6" class="hideall_new">
        <h2><a title="Επιδοτήσεις/ Νομικές Υπηρεσίες/ Μεταφράσεις/ Τεχνικές Μελέτες"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersCC.jsp'})"
               onmouseover="slotMouseOverNew(6);">Συμβουλευτικές Υπηρεσίες</a></h2>
    </div>
    <div id="menu_option_new7" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/bannersjsps/bannersEnv.jsp'})"
               onmouseover="slotMouseOverNew(7);"><span style="color:#7db169; font-size: 14px;">Πράσινες τεχνολογίες - Περιβάλλον</span></a>
        </h2>
    </div>
    <div id="menu_option_new8" class="hideall_new">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOverNew(8);">Mobile - Tablets</a></h2>
    </div>
    <div id="menu_option_new9" class="hideall_new">
        <h2><a title="Marketing"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'gr/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOverNew(9);"><span
                style="color:#2C67A3; font-size: 14px;">Προμήθειες  οργανισμών</span></a></h2>
    </div>
    <%}%>
</div>

<%
    Vector vct = new Vector();
    Vector vctusersno = new Vector();%>

<div id="right_content_bg_new">
<div id="right_content_new">
<div id="slot_new1" style="display: block;">
    <% vct = usman.getSkillsGroupid("1");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            }
    %>
    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a>(<%=vctusersno.size()%>) <%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=1")%>">Most active
    providers</a>
    <%} else {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=1")%>">Οι πιο ενεργοί
    προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new2" style="display: none;">
    <% vct = usman.getSkillsGroupid("2");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>
    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a>(<%=vctusersno.size()%>) <%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=2")%>">Most active
    providers</a>
    <%} else {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=2")%>">Οι πιο ενεργοί
    προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new3" style="display: none;">
    <% vct = usman.getSkillsGroupid("3");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>

    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a> (<%=vctusersno.size()%>)<%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=3")%>">Most active
    providers</a>
    <%} else {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=3")%>">Οι πιο ενεργοί
    προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new4" style="display: none;">
    <% vct = usman.getSkillsGroupid("4");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>

    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a> (<%=vctusersno.size()%>)<%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=4")%>">Most active
    providers</a>
    <%} else {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=4")%>">Οι πιο ενεργοί
    προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new5" style="display: none;">
    <% vct = usman.getSkillsGroupid("5");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>

    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a> (<%=vctusersno.size()%>)<%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=5")%>">Most active
    providers</a>
    <%} else {%>
    <br/> <a class="mostactiveprovlink"
             href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=5")%>">Οι πιο ενεργοί
    προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new6" style="display: none;">
    <% vct = usman.getSkillsGroupid("6");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>

    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a> (<%=vctusersno.size()%>)<%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=6")%>">Most
        active providers</a>
    <%} else {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=6")%>">Οι
        πιο ενεργοί προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new7" style="display: none;">
    <% vct = usman.getSkillsGroupid("7");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>

    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a> (<%=vctusersno.size()%>)<%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=7")%>">Most
        active providers</a>
    <%} else {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=7")%>">Οι
        πιο ενεργοί προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new8" style="display: none;">
    <% vct = usman.getSkillsGroupid("8");
        for (int i = 0; i < vct.size(); i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>

    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>"><%=skill.getSkillname()%>
    </a> (<%=vctusersno.size()%>)<%if (i < (vct.size() - 1)) {%>,<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=8")%>">Most
        active providers</a>
    <%} else {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=8")%>">Οι
        πιο ενεργοί προμηθευτές</a>
    <%}%>
</div>
<div id="slot_new9" style="display: none;">
    <% vct = usman.getSkillsGroupid("9");
        int size = vct.size();
        if (size > 32) size = 32;
        for (int i = 0; i < size; i++) {
            SkillsBean skill = (SkillsBean) vct.elementAt(i);
            vctusersno = usman.getNoUsersbyskill(skill.getId());
            String titlestring = "";
            if ((skill.getTitle() == null) || (skill.getTitle().equals("")) || (skill.getTitle().equals("null")) || (skill.getTitle().equals("NULL"))) {
                titlestring = "";
            } else {
                titlestring = skill.getTitle();
            } %>

    <a title="<%=titlestring%>" class="blueskilllinks"
       href="<%= response.encodeURL("index.jsp?link=skilldevs&skillid="+skill.getId())%>">

        <%if (lang.equals("en")) {%><%=skill.getSkillname()%><%} else {%> <%=skill.getSkillnamegr()%><%}%>

    </a> (<%=vctusersno.size()%>)<%if (i < (size - 1)) {%>,<%} else if (i == (size - 1)) {%>...<%}%>
    <%}%>
    <%if (lang.equals("en")) {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=9")%>">Most
        active providers</a>
    <%} else {%>
    <a class="mostactiveprovlink" href="<%= response.encodeURL("index.jsp?link=skillcatdevs&skillgroupid=9")%>">Οι
        πιο ενεργοί προμηθευτές</a>
    <%}%>
</div>
</div>
</div>
</div>
</div>
<!-- End of Javascript -->
<%--<%}else{%>--%>
<%--<%}%>--%>


</div>
</div>

<div id="wrapper" class="clearfix">

    <jsp:include page="<%=lang + \"/\" + \"tagcloud.jsp\"%>"/>
</div>

<!--<div id="banner" class="clearfix">-->

<!--</div>-->
<%--Browse projects--%>
<%--<div id="sub_content2">--%>
<div id="sub_wrapper2" class="clearfix">
<div id="leftcol" style="padding-bottom:10px">

<%if (lang.equals("en")) {%>
<h1 style="padding-bottom: 0px"><a href="<%= response.encodeURL("index.jsp?link=homepage")%>"><img src="images/titleen.png" alt="Latest Projects"
                                                                   width="220"/></a>
<a href="rssfeed.jsp" style="text-align:right;"><img src="images/rsssmall.png" alt="RSS" width="60" title="RSS Feed"/></a></h1>
<%} else {%>
<h1 style="padding-bottom: 0px"><a href="<%= response.encodeURL("index.jsp?link=homepage")%>"><img src="images/titlegr.png" alt="Τελευταία Έργα"
                                                                   width="220"/></a>
<a href="rssfeed.jsp" style="text-align:right;"><img src="images/rsssmall.png" alt="RSS" width="60" title="RSS Feed"/></a></h1>
<%}%>

<span class="underline"></span>

<div id="projects_selection">
<div id="left_content">
    <div id="menu_option1" class="showall">
        <h2>
            <a title="<%if (lang.equals("en")){%><%}else{%>Backend Προγραμματισμός/ Κατασκευή Λογισμικού/ Βάσεις Δεδομένων<%}%>"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(1);">Programming/Software/Database Development</a></h2>
    </div>
    <div id="menu_option2" class="hideall">
        <h2><a title="<%if (lang.equals("en")){%><%}else{%>Δικτυακή Υποστήριξη<%}%>"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(2);">Network Support</a></h2>
    </div>

    <div id="menu_option3" class="hideall">
        <h2>
            <a title="<%if (lang.equals("en")){%><%}else{%>Διαδικτυακός Προγραμματισμός(Frontend)/ Σχεδιασμός Διεπιφάνειας/ PHP Frameworks<%}%>"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(3);">Web Development/Web Design</a></h2>
    </div>
    <div id="menu_option4" class="hideall">
        <h2><a title="<%if (lang.equals("en")){%><%}else{%>Σχέδιο/ Γραφιστική/ Νέες Τεχνολογίες<%}%>"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(4);">Art & Design/New Technologies</a></h2>
    </div>
    <div id="menu_option5" class="hideall">
        <h2><a title="<%if (lang.equals("en")){%>Web/ Press/ Media<%}else{%>Διαδίκτυο/ Τύπος/ ΜΜΕ<%}%>"
               href="<%= response.encodeURL("index.jsp?link=connectingprofessionals")%>"
               onmouseover="slotMouseOver(5);">Marketing</a></h2>
    </div>
    <div id="menu_option6" class="hideall">
        <h2>
            <a title="<%if (lang.equals("en")){%><%}else{%>Επιδοτήσεις/ Νομικές Υπηρεσίες/ Μεταφράσεις/ Τεχνικές Μελέτες<%}%>"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(6);"><%if (lang.equals("en")) {%>Consulting-Copywriting<%} else {%>
                Συμβουλευτικές Υπηρεσίες<%}%></a></h2>
    </div>
    <div id="menu_option7" class="hideall">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(7);"><span
                style="color:#7db169; font-size: 14px;"><%if (lang.equals("en")) {%>Green Technology - Ecology<%} else {%>Πράσινες τεχνολογίες - Περιβάλλον<%}%></span></a>
        </h2>
    </div>
    <div id="menu_option8" class="hideall">
        <h2><a title="<%if (lang.equals("en")){%><%}else{%>Mobile - Tablets<%}%>"
               href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(8);">Mobile - Tablets</a></h2>
    </div>
    <div id="menu_option9" class="hideall">
        <h2><a href="Javascript:jmaki.publish('/jmaki/ads/setInclude', {value:'en/bannersjsps/bannersWebM.jsp'})"
               onmouseover="slotMouseOver(9);"><span
                style="color:#2C67A3; font-size: 14px;"><%if (lang.equals("en")) {%>Organization supplies<%} else {%>Προμήθειες οργανισμών<%}%></span></a>
        </h2>
    </div>
</div>

<%
    Vector vec = new Vector();
    User u = new User();
    int sizep = 0; %>

<div id="right_content_bg">
<div id="right_content">
<div id="slot1" style="display: block;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(1);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot2" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(2);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot3" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(3);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>)"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot4" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(4);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot5" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(5);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot6" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(6);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot7" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(7);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot8" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(8);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
<div id="slot9" style="display: none;">
    <% vec = projectbidsmanagment.getOpenPostedProjectsByCategory(9);
        sizep = vec.size();
        if (sizep == 0) {
            if (lang.equals("en")) {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnowen.gif" align="middle" alt="Post a project"/> </a>
    <%} else {%>
    <a target="_parent" href="<%= response.encodeURL("index.jsp?link=postanewproject")%>">
        <img src="images/postnow.jpg" align="middle" alt="Post a project"/> </a>
    <%
        }
    } else {
        for (int i = 0; i < vec.size(); i++) {
            PostedProject o = (PostedProject) vec.elementAt(i);
            int buyerid = o.getUserid();
            int truebuyerid = projectbidsmanagment.getBuyerMatchPP(o.getProjectid());
            u = usman.getUserprofile(truebuyerid);
    %>
    <h3>
        <a href="<%= response.encodeURL("index.jsp?link=postedprojectwelcome&ppid="+o.getProjectid())%>"><%=o.getTitle()%>
        </a></h3>
    <%if ((u.getCompanytName() == null) || (u.getCompanytName().equals("")) || (u.getCompanytName().equals("null"))) { %>
    <h4><%if (lang.equals("en")) {%>Posted by buyer<%} else {%>Αναρτήθηκε από αγοραστή<%}%></h4>
    <%} else {%>
    <h4><%if (lang.equals("en")) {%>Posted by <%=u.getCompanytName()%><%} else {%>Αναρτήθηκε
        από <%=u.getCompanytName()%><%}%></h4>
    <%}%>
    <%}%>
    <%}%>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<%--<div id="sub_content">--%>
<%--<div id="sub_wrapper" class="clearfix" >--%>

<%--&lt;%&ndash;<%if(request.getParameter("myVar")!=null){%>&ndash;%&gt;--%>
<%--&lt;%&ndash;<jsp:include page="loadflash.jsp"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%}else{%>&ndash;%&gt;--%>

<%--<div id="maincol" >--%>

<%--<div id="rightwelcomemenu">--%>
<%--<% if (lang.equals("gr")){%>--%>
<%--<jsp:include page="gr/showpostprojects.jsp"/>   <% }else{ %>--%>
<%--<jsp:include page="en/showpostprojects.jsp"/>--%>
<%--<%}%>--%>

<%--</div>--%>

<%--</div>--%>

<%--&lt;%&ndash;<div id="maincolw">--%>
<%--<% if (lang.equals("gr")){%>--%>
<%--<jsp:include page="gr/dimosiaerga.jsp"/>   <% }else{ %>--%>
<%--<jsp:include page="en/dimosiaerga.jsp"/>--%>
<%--<%}%>--%>
<%--</div>&ndash;%&gt;--%>

<%--</div>--%>
<%--</div>--%>

<div id="banner2" class="clearfix" style="padding-bottom: 10px;height: auto;">
    <% if (lang.equals("gr")) {%>
    <img src="images/howitworksgr.jpg" alt="How it works?" style="padding-top:25px;"> <% } else { %>
    <img src="images/howitworks.jpg" alt="How it works?" style="padding-top:25px;">
    <%}%>
</div>

<div id="sidead" <%if (lang.equals("en")) {%>
     style="right:0; background:url('images/thegamead.gif') no-repeat scroll 0 0 transparent;"<%} else {%>
     style="right:0; background:url('images/thegamead.gif') no-repeat scroll 0 0 transparent;" <%}%>>
    <div id="sideadwrap">
        <a id="driverlink" href="javascript:void(0);"
           onclick="window.open('http://www.youtube.com/watch?v=fyl2WVyiYn4', '_blank')"></a>
        <a id="driverclose" href="javascript:void(0)"
           onclick=" $('#sidead').animate({'right':'-400'},'slow','swing');"></a>
    </div>

</div>

<div id="footer_wrapper">

    <div id="footer_class">
        <div id="footer_left">
            <div id="footer_left_1">
                <a href="http://www.linkedin.com/company/freelancing.gr?trk=fc_badge"><img
                        src="http://static01.linkedin.com/scds/common/u/img/webpromo/btn_cofollow_badge.png" locale="en"
                        alt="freelancing.gr on LinkedIn"></a>
                <a href="http://www.facebook.com/group.php?gid=18074537606&ref=ts" target="_blank"><img
                        src="images/facebook.gif" alt="Find us on Facebook"/></a>
                <a href="http://twitter.com/freelancinggr" target="_blank"><img src="images/twitterbird.png"
                                                                                alt="Follow us on twitter"/></a>

            </div>
            <div id="footer_left_2">
                <ul>
                    <%if (lang.equals("en")) {%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=faqs")%>">FAQs</a></li>
                    <%if (landing.equals("buyer")) {%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=buyersguidelines")%>">Buyers Guide</a></li>
                    <%} else {%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=providersguidelines")%>">Provider Guide</a></li>
                    <%}%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=whatproject&target=1")%>">Project posting
                        types</a></li>
                    <li><a href="<%= response.encodeURL("index.jsp?link=whatproject&target=2")%>">Award procedures</a>
                    </li>
                    <li><a href="<%= response.encodeURL("index.jsp?link=managedprojects")%>">Managed Projects</a></li>

                    <%} else {%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=faqs")%>">Συχνές ερωτήσεις</a></li>
                    <%if (landing.equals("buyer")) {%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=buyersguidelines")%>">Οδηγός αγοραστών</a></li>
                    <%} else {%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=providersguidelines")%>">Οδηγός προμηθευτών</a>
                    </li>
                    <%}%>
                    <li><a href="<%= response.encodeURL("index.jsp?link=whatproject&target=1")%>">Τύποι δημοσίευσης
                        έργων</a></li>
                    <li><a href="<%= response.encodeURL("index.jsp?link=whatproject&target=2")%>">Διαδικασίες
                        ανάθεσης</a></li>
                    <li><a href="<%= response.encodeURL("index.jsp?link=managedprojects")%>">Managed Projects</a></li>
                    <li><a href="<%= response.encodeURL("index.jsp?link=concept")%>">Ρόλοι συνεργασίας</a></li>
                    <%}%>
                </ul>
            </div>
            <br/> <a href="<%= response.encodeURL("index.jsp?link=connectingprofessionals")%>">
            <b><%if (lang.equals("en")) {%>Get your freelancing link<%} else {%>Πάρε το freelancing link
                σου<%}%></b></a>
            <br/> <br/>
            <a class="aboutfooter2" href="<%= response.encodeURL("index.jsp?link=wall")%>">The Wall</a>
            <%if (lang.equals("en")) {%>
            <a href="<%= response.encodeURL("index.jsp?link=panelscontest")%>">Contests</a>
            <%} else {%>
            <a href="<%= response.encodeURL("index.jsp?link=panelscontest")%>">Διαγωνισμοί</a>
            <%}%>   <br/> <br/>
            <a href="<%= response.encodeURL("index.jsp?link=newsletter")%>"><img src="images/newsletter.gif"
                                                                                 alt="Newsletter"
                                                                                 title="Free Newsletter" width="169"
                                                                                 height="30"></a>
        </div>
        <div id="footer_right">
            <%if (lang.equals("en")) {%>
            <a href="<%= response.encodeURL("welcome2.jsp?lang=en")%>">
                <img src="images/Fotter-Bottom-Right-en.jpg" alt="Freelancing.gr" title="Freelancing.gr Software Team"
                     width="355" height="106"/> </a>
            <%} else {%>
            <a href="<%= response.encodeURL("welcome2.jsp?lang=gr")%>"> <img src="images/Fotter-Bottom-Right-gr.jpg"
                                                                             alt="Freelancing.gr"
                                                                             title="Freelancing.gr Ανάπτυξη Λογισμικού "
                                                                             width="355" height="106"/> </a>
            <%}%>
        </div>
    </div>
</div>
</div>
<div id="copyright_wrapper">
    <div id="copyright">
        <ul>
            <li>freelancing.gr 2005 |</li>
            <%if (lang.equals("en")) {%>
            <li><a href="<%= response.encodeURL("index.jsp?link=legal")%>">Legal Notice</a> |</li>
            <li><a href="<%= response.encodeURL("index.jsp?link=privacy")%>">Privacy Policy</a> |</li>
            <li><a href="<%= response.encodeURL("index.jsp?link=encoding")%>">Encoding</a> |</li>
            <li><a href="<%= response.encodeURL("index.jsp?link=sitemap")%>">Sitemap</a></li>
            <li><a title="Suggestions for improving usability." class="golirightA"
                   href="<%= response.encodeURL("index.jsp?link=feedback")%>">feedback</a></li>
            <%} else {%>
            <li><a href="<%= response.encodeURL("index.jsp?link=legal")%>">Νομική δήλωση</a> |</li>
            <li><a href="<%= response.encodeURL("index.jsp?link=privacy")%>">Προστασία Προσωπικών Δεδομένων</a> |</li>
            <li><a href="<%= response.encodeURL("index.jsp?link=encoding")%>">Κωδικοποίηση</a> |</li>
            <li><a href="<%= response.encodeURL("index.jsp?link=sitemap")%>">Sitemap</a></li>
            <li><a title="Προτάσεις για βελτίωση της χρηστικότητας." class="golirightB"
                   href="<%= response.encodeURL("index.jsp?link=feedback")%>">feedback</a></li>
            <%}%>
        </ul>


    </div>


</div>

</div>
<script type="text/javascript">
    $('#sidead').animate({'right':'0'}, "slow", "swing");
</script>

<script type="text/javascript" xml:space="preserve">
    /*
     Rewrite #anchor links for pages with BASE HREF
     */
    var anchors = document.getElementsByTagName("a");
    var basehref = document.getElementsByTagName("base")[0].href;
    var url = window.location.href;
    if (url.indexOf("#") > 0) url = url.substr(0, url.indexOf("#")); //strip hash
    if (basehref) {
        for (var i = 0; i < anchors.length; i++) {
            var anchor = anchors[i];
            poundPos = anchor.href.indexOf("/#");
            if (poundPos > 0) {
                anchor.href = url + anchor.href.substr(poundPos + 1);
            }
        }
    }
</script>
</body>
</html>