function fn() {

    var config = {};

    if (karate.env == 'qa') {
        config.baseUrl = 'https://jsonplaceholder.typicode.com';
    }
    else if (karate.env == 'staging') {
        config.baseUrl = 'https://jsonplaceholder.typicode.com';
    }
    else {
        config.baseUrl = 'https://jsonplaceholder.typicode.com';
    }

    var accountServiceUrl = karate.properties['accountServiceUrl'];

    if (accountServiceUrl) {
        config.accountServiceUrl = accountServiceUrl;
    }

    return config;
}