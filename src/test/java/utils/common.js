function fn() {

    var utils = {};

    utils.generateCustomerId = function() {
        return 'CUST-' + java.util.UUID.randomUUID();
    };

    return utils;
}