var cards = CreditCard.query(function() {
  // GET: /user/123/card
  // server returns: [ {id:456, number:'1234', name:'Smith'} ];
 
  var card = cards[0];
  // each item is an instance of CreditCard
  expect(card instanceof CreditCard).toEqual(true);
  card.name = "J. Smith";
  // non GET methods are mapped onto the instances
  card.$save();
  // POST: /user/123/card/456 {id:456, number:'1234', name:'J. Smith'}
  // server returns: {id:456, number:'1234', name: 'J. Smith'};
 
  // our custom method is mapped as well.
  card.$charge({amount:9.99});
  // POST: /user/123/card/456?amount=9.99&charge=true {id:456, number:'1234', name:'J. Smith'}

});

