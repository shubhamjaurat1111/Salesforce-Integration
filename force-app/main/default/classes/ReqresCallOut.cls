/**
 * @description       : 
 * @author            : Shubham Jaurat
 * @group             : 
 * @last modified on  : 01-11-2025
 * @last modified by  : Shubham Jaurat
**/
public with sharing class ReqresCallOut {
    
    public static void getUsersFromExternalSyatem(){

        Http httpObject = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://reqres.in/api/users');
        request.setHeader('Content-Type','application/json');
        request.setMethod('GET');
        //request.setBody('body');
        HttpResponse response = new HttpResponse();
        
        response = httpObject.send(request);
        System.debug('response.getBody()======>: ' + response.getBody());
    }


    public static void CreateUser(){

        Http httpObject = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://reqres.in/api/users');
        request.setHeader('Content-Type','application/json');
        request.setMethod('POST');
        request.setBody('{ "name": "Shubham","job": "Salesforce Developer"}');
        HttpResponse response = new HttpResponse();
        
        response = httpObject.send(request);
        System.debug('response.getBody()======>: ' + response.getBody());
    }
}