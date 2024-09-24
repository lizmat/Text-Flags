[![Actions Status](https://github.com/lizmat/Text-Flags/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Text-Flags/actions) [![Actions Status](https://github.com/lizmat/Text-Flags/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Text-Flags/actions) [![Actions Status](https://github.com/lizmat/Text-Flags/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Text-Flags/actions)

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

Text::Flags provides an easy interface to the Unicode codepoints that render as flags, and their associated regions and names.

It also contains a command-line interface `tf` that either takes any number of flag identifiers (e.g. `tf chequered` will show 🏁). This also takes an optional `--list` argument to show all supported flags, and a `--verbose` argument to show additional information about the indicated flag(s).

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

%deprecated
-----------

```raku
say %deprecated<BU>;   # Burma
```

The `%deprecated` hash contains the mapping of deprecated country / region codes to their associated name. Keys can be specified in either uppercase or lowercase.

You can use the `.keys` method to find out which deprecations are known. Please note that only lowercase keys will be returned.

EXPORTED SUBROUTINES
====================

ric
---

```raku
say ric("NL").uninames;  # (REGIONAL INDICATOR SYMBOL LETTER N REGIONAL INDICATOR SYMBOL LETTER L)
```

The `ric` subroutine performs a Regional Indicator case conversion on a given string. Any letter (either lowercase or uppercase) is converted to its associated Regional Indicator version, e.g. "a" (also known as "LATIN SMALL LETTER A") is converted to "REGIONAL INDICATOR SYMBOL LETTER A".

This is primarily intended as a helper subroutine, but may have other uses outside of this module.

SUPPORTED FLAGS
===============

    ac ad ae af ag ai al am ao aq ar as at au aw ax az
    ba bb bd be bf bg bh bi bj bl bm bn bo bq br bs bt bv bw by bz
    ca cc cd cf cg ch ci ck cl cm cn co cp cr cu cv cw cx cy cz
    de dg dj dk dm do dz
    ea ec ee eg eh er es et eu
    fi fj fk fm fo fr
    ga gb gd ge gf gg gh gi gl gm gn gp gq gr gs gt gu gw gy
    hk hm hn hr ht hu
    ic id ie il im in io iq ir is it
    je jm jo jp
    ke kg kh ki km kn kp kr kw ky kz
    la lb lc li lk lr ls lt lu lv ly
    ma mc md me mf mg mh mk ml mm mn mo mp mq mr ms mt mu mv mw mx my mz
    na nc ne nf ng ni nl no np nr nu nz
    om
    pa pe pf pg ph pk pl pm pn pr ps pt pw py
    qa
    re ro rs ru rw
    sa sb sc sd se sg sh si sj sk sl sm sn so sr ss st sv sx sy sz
    ta tc td tf tg th tj tk tl tm tn to tr tt tv tw tz
    ua ug um un us uy uz
    va vc ve vg vi vn vu
    wf ws xk
    ye yt
    za zm zw

    england scotland wales

    california texas

    black chequered crossed pirate rainbow transgender triangular white

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Text-Flags . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2020, 2021, 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

