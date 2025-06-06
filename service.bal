import ballerina/http;
import ballerinax/mongodb;

//MongoDB connection details
configurable string database = ?;
configurable string connectionString = ?;

listener http:Listener httpDefaultListener = new (9090);

//MongoDB Atlas Connection
mongodb:Client mongoDb = check new ({
    connection: connectionString
});

service /orders on httpDefaultListener {
    resource function get connect() returns string|error {
        mongodb:Database db = check mongoDb->getDatabase(database);
        string[] collectionNames = check db->listCollectionNames();
        return "Connected to the MongoDB database: " + collectionNames.toString();

    }
}