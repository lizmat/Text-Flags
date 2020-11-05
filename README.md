NAME
====

Text::Flags - easy interface to Unicode flags

SYNOPSIS
========

```raku
use Text::Flags;

say "This is the flag of %regions<NL>: %flags<NL>"
```

DESCRIPTION
===========

Text::Flags is an easy interface to the Unicode codepoints that render as flags, and their associated regions and names.

EXPORTED HASHES
===============

%flags
------

```raku
say %flags<chequered>;   # 🏁
```

The `%flags` hash contains the mapping of country / region codes and some special flags, to their associated Unicode representations. Please note that some flags, or possibly all flags, may not render correctly on your platform, even if they are valid Unicode representations. Keys can be specified in either uppercase or lowercase.

You can use the `.keys` method to find out which flags are supported. Please note that only lowercase keys will be returned.

%regions
--------

```raku
say %regions<NL>;   # The Netherlands
```

The `%regions` hash contains the mapping of country / region codes to their associated name. Keys can be specified in either uppercase or lowercase.

You can use the `.keys` method to find out which regions are supported. Please note that only lowercase keys will be returned.

EXPORTED SUBROUTINES
====================

ric
---

```raku
say ric("NL").uninames;  # (REGIONAL INDICATOR SYMBOL LETTER N REGIONAL INDICATOR SYMBOL LETTER L)
```

The `ric` subroutine performs a Regional Indicator case conversion on a given string. Any letter (either lowercase or uppercase) is converted to its associated Regional Indicator version, e.g. "a" (also known as "LATIN SMALL LETTER A") is converted to "REGIONAL INDICATOR SYMBOL LETTER A".

This is primarily intended as a helper subroutine, but may have other uses outside of this module.

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/Text-Flags . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2020 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

