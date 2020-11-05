use Test;
use Text::Flags;

my @regions = <
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

>;
#  england scotland texas wales

my @specials  = <
>;
#  black chequered crossed pirate rainbow transgender triangular white

plan 8 * @regions + 4 * @specials;

for @regions {
    ok %flags{$_ }:exists, "does it look like there is a flag for $_";
    ok %flags{.uc}:exists, "does it look like there is a flag for {.uc}";
    ok %regions{$_ }:exists, "does it look like there is region info for $_";
    ok %regions{.uc}:exists, "does it look like there is region info for {.uc}";

    ok %flags{$_ }, "is there a flag for $_";
    ok %flags{.uc}, "is there a flag for {.uc}";
    ok %regions{$_ }, "is there region info for $_";
    ok %regions{.uc}, "is there region info for {.uc}";
}

for @specials {
    ok %flags{$_ }:exists, "does it look like there is a $_ flag";
    ok %flags{.uc}:exists, "does it look like there is a {.uc} flag";

    ok %flags{$_ }, "is there a $_ flag";
    ok %flags{.uc}, "is there a {.uc} flag";
}

# vim: expandtab shiftwidth=4
