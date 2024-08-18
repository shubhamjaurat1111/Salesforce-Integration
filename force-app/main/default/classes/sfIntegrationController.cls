/**
 * @description       : 
 * @author            : Shubham Jaurat
 * @group             : 
 * @last modified on  : 08-18-2024
 * @last modified by  : Shubham Jaurat
**/

//Source org
public class sfIntegrationController {
	@future(callout = true)
    public static void getDetails(){
        HttpRequest req = new HttpRequest();
        // req.setEndpoint('https://enzigma39-dev-ed.develop.my.salesforce.com/services/apexrest/Account/');
        req.setEndpoint('callout:myCred/services/apexrest/Account/');
        req.setHeader('content-type','application/json; charset=UTF-8');
        req.setHeader('Accept','application/json');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse response= http.send(req);
        system.debug('respsonse code : '+response.getStatusCode());
        system.debug('respsonse code : '+response.getBody());
        
    }
    
  

}