# acme-sales-poc

Proof of Concept for the Acme Widget Co sales system.

## Usage

### Via IRB

You can use a convenience method `SalesPoC.new_basket` to build an empty basket with the pre-set
delivery charge rules and offers.

#### Example

```ruby
irb(main):001> require_relative "lib/sales_poc"
=> true
irb(main):002> basket = SalesPoC.new_basket
=>
#<SalesPoC::Basket:0x000000011cb383b0
...
irb(main):003> basket.add("R01")
=> [#<SalesPoC::Product:0x000000011cc341b0 @base_price=0.3295e2, @code="R01", @discount=0.0, @name="Red Widget">]
irb(main):004> basket.add("R01")
=>
[#<SalesPoC::Product:0x000000011cc341b0 @base_price=0.3295e2, @code="R01", @discount=0.0, @name="Red Widget">,
 #<SalesPoC::Product:0x000000011ceda798 @base_price=0.3295e2, @code="R01", @discount=0.0, @name="Red Widget">]
irb(main):005> basket.add("G01")
=>
[#<SalesPoC::Product:0x000000011cc341b0 @base_price=0.3295e2, @code="R01", @discount=0.0, @name="Red Widget">,
 #<SalesPoC::Product:0x000000011ceda798 @base_price=0.3295e2, @code="R01", @discount=0.0, @name="Red Widget">,
 #<SalesPoC::Product:0x000000011ca98680 @base_price=0.2495e2, @code="G01", @discount=0.0, @name="Green Widget">]
irb(main):006> basket.total
=> 77.32

```

Alternatively, you can access the `Basket` interface and inject dependencies manually (see [lib/sales_poc.rb](./lib/sales_poc.rb)).

## Assumptions made

* The offers/discounts are applied only at the time of calculating the total:
  this may not be always ideal, but it's quite practical and enough for a PoC
* Although you cannot add products that don't exists, no exception is raised:
  something you may want to do in a live context
* The basket cannot be emptied / items cannot be removed, although this should
  be straightforward to implement
* The product catalogue and the delivery charge rules are obviously static and
  passed to the `Basket` interface as per requirement, so no need to have a DB

## Unit tests

```
$ bundle
$ bundle exec rspec specs
```
