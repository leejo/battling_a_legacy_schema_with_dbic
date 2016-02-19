<section data-markdown="presentation.md" data-separator="^\n\n\n" data-separator-vertical="^\n\n" data-separator-notes="^Note:"></section>


Battling a Legacy Schema With DBIx::Class

[Lee Johnson](http://leejo.github.io)

YAPC::{NA,EU} 2016

---
## Me?

![me](img/card.jpg)

[http://leejo.github.io/code](http://leejo.github.io/code)

---
## Why DBIx::Class?

For any non-trivial application you're going to write a model anyway.

Most trivial applications turn into non-trivial applications.

So "don't leak the abstraction"

DBIx::Class offers many useful features, as we shall see.

Note:
- quote from Ovid
- no writing same SQL over and over
- concentrate on the business logic
- objects

---
### More about that Model

<section>
    <p class="fragment"> MVC </p>
    <p class="fragment"> <font size=40>M</font>V<font size=5>C</font> </p>
    <p class="fragment"> <font size=5>O</font><font size=40>M</font>V<font size=5>C</font> </p>
</section>

Note:
- thin controllers, fat model + ORM

---
### More about that Model

Abstract this away into your model:

```perl
$model->resultset( "Piste" )->find( 17 )->name;
```

Like so:

```perl
SkiResort::Model::Piste->new( id => 17 )->name;
```

You're controllers are then not coupled to the data store

And they know nothing about the ORM

Note:
- example: ./slides/more_about_that_model.sh 17 (+ exception)
- controller(s) not tightly coupled to the schema
- model code makes the decisions on storage

---
### More about that Model

And you can better utilise exceptions:

```
try sub {
	...
	my $piste = SkiResort::Model::Piste->new( id => $piste_id );
	...
},
catch_when 'SkiResort::Exception::Database' => sub {
	# 500 error?
},
catch_when 'SkiResort::Exception::Input' => sub {
	# 400 error?
},
catch_default sub {
	# something else?
};
```

---
## Legacy Schema?


---
## Generating schema classes


---
## Adding relationships


---
## Solving joins on polymorphic relationships


---
## Filtering columns


---
## Fixing data types with filters


---
## Virtual views and reports


---
## Query tracing and profiling


---
## In Summary

+ Foo
    - Bar
    - Baz
+ Boz
+ Biz

---
## Questions?

Links and resources:
