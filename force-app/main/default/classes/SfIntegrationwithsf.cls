/**
 * @description       : 
 * @author            : Shubham Jaurat
 * @group             : 
 * @last modified on  : 08-18-2024
 * @last modified by  : Shubham Jaurat
**/

//Target Org
@restResource(urlMapping='/Account/*')
global class SfIntegrationwithsf {
    
    @httpGet
    global static List<Account> getAccount(){
        return [Select Id,Name from Account];
    }
}