define ['cs!models/customerCollection',
		'cs!models/filterCityCollection'], (CustomerCollection, FilterCityCollection)->
	describe 'Customer Collection', ->
		beforeEach ->
			@customers_data = [
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
			@customerCollection = new CustomerCollection @customers_data
		after ->
			@customerCollection.off()
		describe 'applyFilters', ->
			it 'filters by age', ()->
				@customerCollection.filterByAge = {min_age: 5, max_age: 15}
				expect(@customerCollection.applyFilters().length).to.be.eq(2)
			it 'filters by city', ()->
				originalCollection = new CustomerCollection @customers_data
				filterCityCollection = new FilterCityCollection(originalCollection, @customerCollection)
				filterCityCollection.reload()
				_.each(filterCityCollection.models, (model) =>
					model.set('checked', false)
				)
				filterCityCollection.models[1].set('checked', true)
				originalCollection.filterByCity = filterCityCollection
				expect(originalCollection.applyFilters().length).to.be.eq(1)
		describe 'onCollectionChange', ->
			it 'triggers collection change', ()->
				called = false
				@customerCollection.bind 'customer_collection::onCollectionChanged', =>
					called = true
				@customerCollection.onCollectionChanged()
				expect(called).to.be.eq(yes)


