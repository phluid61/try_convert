Try Convert
===========

A ruby gem that adds some missing `::try_convert` methods to classes where it could be useful.

Rationale
---------

The following defensive pattern is quite common:

```ruby
if obj.respond_to? :to_int
  i = obj.to_int
else
  die
end
```

I believe it to be somewhat of an antipattern, compared to:

```ruby
i = Integer.try_convert(obj) or die
```


New Methods
-----------

```ruby
Float.try_convert(obj)

Integer.try_convert(obj)

Proc.try_convert(obj)
```

* [Contributor Code of Conduct](code_of_conduct.md)
* [![Build Status](https://secure.travis-ci.org/phluid61/try_convert.png)](http://travis-ci.org/phluid61/try_convert)
* [![Gem Version](https://badge.fury.io/rb/try_convert.png)](http://badge.fury.io/rb/try_convert)
