Try Convert
===========

[![Gem Version](https://badge.fury.io/rb/try_convert.png)](http://badge.fury.io/rb/try_convert)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v3.0%20adopted-ff69b4.svg)](code_of_conduct.md)

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

## Contributor Code of Conduct

This repository is subject to a [Contributor Code of Conduct](code_of_conduct.md)
adapted from the [Contributor Covenant][cc], version 3.0, available at
<https://www.contributor-covenant.org/version/3/0/>


[cc]: https://www.contributor-covenant.org


## Licence

This project is licensed under the ISC licence. See [LICENSE](LICENSE)
for details
