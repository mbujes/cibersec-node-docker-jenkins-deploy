var request = require('supertest');
var app = require('../index.js');

describe('GET /', function() {
  it('debe responder con hola clase', function(done) {
    request(app).get('/').expect('<h1>hola clase</h1>', done);
    done();
  });
});
