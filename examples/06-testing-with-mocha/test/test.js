// Generated by CoffeeScript 1.4.0
(function() {

  define(['cs!models/customerCollection'], function(CustomerCollection) {
    return describe('Customer Collection', function() {
      return describe('onCollectionChange', function() {
        before(function() {
          var customers_data;
          customers_data = [
            {
              name: 'John',
              age: 22,
              city: 'London'
            }, {
              name: "Tim",
              age: 5,
              city: 'Paris'
            }, {
              name: "Ida",
              age: 26,
              city: 'London'
            }, {
              name: "Mary",
              age: 12,
              city: 'Athens'
            }, {
              name: "Jay",
              age: 33,
              city: 'New York'
            }, {
              name: "Kate",
              age: 24,
              city: 'New York'
            }, {
              name: "Elio",
              age: 25,
              city: 'Porto'
            }, {
              name: "Rob",
              age: 55,
              city: 'Berlin'
            }
          ];
          return this.customerCollection = new CustomerCollection(customers_data);
        });
        after(function() {
          return this.customerCollection.off();
        });
        return it('triggers collection change', function() {
          var called,
            _this = this;
          called = false;
          this.customerCollection.bind('customer_collection::onCollectionChanged', function() {
            return called = true;
          });
          this.customerCollection.onCollectionChanged();
          return expect(called).to.be.eq(true);
        });
      });
    });
  });

}).call(this);
