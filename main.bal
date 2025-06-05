import ballerina/http;

listener http:Listener httpDefaultListener = new (9090);

service /orders on httpDefaultListener {
    
    resource function get .() returns error|json|http:InternalServerError {
        return {
            message: "All orders retrieved",
            orders: []
        };
    }

    resource function get [string orderId]() returns error|json|http:InternalServerError {
        return {
            orderId: orderId,
            message: "Order details retrieved"
        };
    }
}