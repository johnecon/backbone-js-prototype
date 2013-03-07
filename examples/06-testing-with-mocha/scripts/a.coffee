define [
  'cs!../modules/views/addView',
  'cs!../modules/views/customerView',
  'cs!../modules/views/customerCollectionView',
  'cs!../modules/views/filterCityView',
  'cs!../modules/views/filterCityCollectionView',
  'cs!../modules/models/customerCollection',
  'cs!../modules/models/filterAgeRange',
  'cs!../modules/models/filterCityCollection'], (AddView, CustomerView, CustomerCollectionView, FilterCityView, FilterCityCollectionView, CustomerCollection, FilterAgeRange, FilterCityCollection) ->
    customers_data = [
        name : 'John', age : 22, city : 'London',
      ,
        name: "Tim", age: 5, city : 'Paris',
      ,
        name: "Ida", age: 26, city : 'London',
      ,
        name: "Mary", age: 12, city : 'Athens',
      ,
        name: "Jay", age: 33, city : 'New York',
      ,
        name: "Kate", age: 24, city : 'New York',
      ,
        name: "Elio", age: 25, city : 'Porto',
      ,
        name: "Rob", age: 55, city : 'Berlin'
    ]

    $('.reset_filters').click ->
      window.customerCollection.reset(customers_data)
      window.filterAgeRange.render()
      window.filterCityCollection.originalCollection = originalCollection

    $('.reset_collection').click ->
      window.customerCollection.reset(customers_data)
      window.originalCollection.reset(customers_data)

    window.customerCollection = new CustomerCollection
    window.customerCollection.reset(customers_data)
    window.originalCollection = window.customerCollection.clone()

    filterCityCollection = new FilterCityCollection(window.originalCollection, window.customerCollection)
    filterCityCollection.customerCollection = window.customerCollection
    filterCityCollection.reload()
    window.filterAgeRange = new FilterAgeRange(window.originalCollection, window.customerCollection)
    window.filterAgeRange.render()

    window.originalCollection.filterByAge = window.filterAgeRange
    window.originalCollection.filterByCity = filterCityCollection
    customerCollectionView = new CustomerCollectionView(
      collection : window.customerCollection
      el : $('ul.customers')[0]
    )

    add_view = new AddView(
      el: $("#add_container")
      collection : window.customerCollection
    )
    add_view.originalCollection = window.originalCollection
    add_view.render()

    filterCityCollectionView = new FilterCityCollectionView(
      collection : filterCityCollection
      el : $('ul.filter_cities')[0]
    )

    customerCollectionView.render()
    filterCityCollectionView.render()