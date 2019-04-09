
@isTest
global class WarehouseCalloutServiceMock implements HttpCalloutMock{

    global HTTPResponse respond(HTTPRequest request){
        System.assertEquals('https://th-superbadge-apex.herokuapp.com/equipment', request.getEndpoint());
        System.assertEquals('GET', request.getMethod());

        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"equipment":[{"_id":"55d66226726b611100aaf74b","replacement":true,"quantity":150,"name":"Switch","maintenanceperiod":0,"lifespan":0,"cost":100,"sku":"100013"},{"_id":"55d66226726b611100aaf74c","replacement":true,"quantity":200,"name":"Ball Valve 5 cm","maintenanceperiod":0,"lifespan":0,"cost":30,"sku":"100014"}]}');
        res.setStatusCode(200);
        return res;
    }

}
