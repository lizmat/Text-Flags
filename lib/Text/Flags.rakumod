# Because we have auto-combining on regional indicator codepoints,
# we need to separate them to get the codes by themselves, so we
# put a space inbetween each of them to create consistent mapping.
my constant $alpha = ("a" .. "z").map(*~" ").join.chop;
my constant $ric = (
  "REGIONAL INDICATOR SYMBOL LETTER A".uniparse
  ..
  "REGIONAL INDICATOR SYMBOL LETTER Z".uniparse
).map(*~" ").join.chop;

# convert alpha chars to Regional Indicator symbols
sub ric(Str:D $string --> Str:D) is export {
    $string.lc.trans( $alpha => $ric )
}

# role to map uppercase to lowercase for key access
role LowerCaseKey {
    method AT-KEY(\key)     { nextwith key.lc }
    method EXISTS-KEY(\key) { nextwith key.lc }
}

# supported countries by Regional Indicator symbols
my constant %ric =
  ac  => 'Ascension Island',
  ad  => 'Andorra',
  ae  => 'United Arab Emirates',
  af  => 'Afghanistan',
  ag  => 'Antigua & Barbuda',
  ai  => 'Anguilla',
  al  => 'Albania',
  am  => 'Armenia',
  ao  => 'Angola',
  aq  => 'Antarctica',
  ar  => 'Argentina',
  as  => 'American Samoa',
  at  => 'Austria',
  au  => 'Australia',
  aw  => 'Aruba',
  ax  => 'Åland Islands',
  az  => 'Azerbaijan',
  ba  => 'Bosnia & Herzegovina',
  bb  => 'Barbados',
  bd  => 'Bangladesh',
  be  => 'Belgium',
  bf  => 'Burkina Faso',
  bg  => 'Bulgaria',
  bh  => 'Bahrain',
  bi  => 'Burundi',
  bj  => 'Benin',
  bl  => 'St. Barthélemy',
  bm  => 'Bermuda',
  bn  => 'Brunei',
  bo  => 'Bolivia',
  bq  => 'Caribbean Netherlands',
  br  => 'Brazil',
  bs  => 'Bahamas',
  bt  => 'Bhutan',
  bv  => 'Bouvet Island',
  bw  => 'Botswana',
  by  => 'Belarus',
  bz  => 'Belize',
  ca  => 'Canada',
  cc  => 'Cocos (Keeling) Islands',
  cd  => 'Congo - Kinshasa',
  cf  => 'Central African Republic',
  cg  => 'Congo - Brazzaville',
  ch  => 'Switzerland',
  ci  => 'Côte d’Ivoire',
  ck  => 'Cook Islands',
  cl  => 'Chile',
  cm  => 'Cameroon',
  cn  => 'China',
  co  => 'Colombia',
  cp  => 'Clipperton Island',
  cr  => 'Costa Rica',
  cu  => 'Cuba',
  cv  => 'Cape Verde',
  cw  => 'Curaçao',
  cx  => 'Christmas Island',
  cy  => 'Cyprus',
  cz  => 'Czechia',
  de  => 'Germany',
  dg  => 'Diego Garcia',
  dj  => 'Djibouti',
  dk  => 'Denmark',
  dm  => 'Dominica',
  do  => 'Dominican Republic',
  dz  => 'Algeria',
  ea  => 'Ceuta & Melilla',
  ec  => 'Ecuador',
  ee  => 'Estonia',
  eg  => 'Egypt',
  eh  => 'Western Sahara',
  er  => 'Eritrea',
  es  => 'Spain',
  et  => 'Ethiopia',
  eu  => 'European Union',
  fi  => 'Finland',
  fj  => 'Fiji',
  fk  => 'Falkland Islands',
  fm  => 'Micronesia',
  fo  => 'Faroe Islands',
  fr  => 'France',
  ga  => 'Gabon',
  gb  => 'United Kingdom',
  gd  => 'Grenada',
  ge  => 'Georgia',
  gf  => 'French Guiana',
  gg  => 'Guernsey',
  gh  => 'Ghana',
  gi  => 'Gibraltar',
  gl  => 'Greenland',
  gm  => 'Gambia',
  gn  => 'Guinea',
  gp  => 'Guadeloupe',
  gq  => 'Equatorial Guinea',
  gr  => 'Greece',
  gs  => 'South Georgia & South Sandwich Islands',
  gt  => 'Guatemala',
  gu  => 'Guam',
  gw  => 'Guinea-Bissau',
  gy  => 'Guyana',
  hk  => 'Hong Kong SAR China',
  hm  => 'Heard & McDonald Islands',
  hn  => 'Honduras',
  hr  => 'Croatia',
  ht  => 'Haiti',
  hu  => 'Hungary',
  ic  => 'Canary Islands',
  id  => 'Indonesia',
  ie  => 'Ireland',
  il  => 'Israel',
  im  => 'Isle of Man',
  in  => 'India',
  io  => 'British Indian Ocean Territory',
  iq  => 'Iraq',
  ir  => 'Iran',
  is  => 'Iceland',
  it  => 'Italy',
  je  => 'Jersey',
  jm  => 'Jamaica',
  jo  => 'Jordan',
  jp  => 'Japan',
  ke  => 'Kenya',
  kg  => 'Kyrgyzstan',
  kh  => 'Cambodia',
  ki  => 'Kiribati',
  km  => 'Comoros',
  kn  => 'St. Kitts & Nevis',
  kp  => 'North Korea',
  kr  => 'South Korea',
  kw  => 'Kuwait',
  ky  => 'Cayman Islands',
  kz  => 'Kazakhstan',
  la  => 'Laos',
  lb  => 'Lebanon',
  lc  => 'St. Lucia',
  li  => 'Liechtenstein',
  lk  => 'Sri Lanka',
  lr  => 'Liberia',
  ls  => 'Lesotho',
  lt  => 'Lithuania',
  lu  => 'Luxembourg',
  lv  => 'Latvia',
  ly  => 'Libya',
  ma  => 'Morocco',
  mc  => 'Monaco',
  md  => 'Moldova',
  me  => 'Montenegro',
  mf  => 'St. Martin',
  mg  => 'Madagascar',
  mh  => 'Marshall Islands',
  mk  => 'North Macedonia',
  ml  => 'Mali',
  mm  => 'Myanmar (Burma)',
  mn  => 'Mongolia',
  mo  => 'Macao Sar China',
  mp  => 'Northern Mariana Islands',
  mq  => 'Martinique',
  mr  => 'Mauritania',
  ms  => 'Montserrat',
  mt  => 'Malta',
  mu  => 'Mauritius',
  mv  => 'Maldives',
  mw  => 'Malawi',
  mx  => 'Mexico',
  my  => 'Malaysia',
  mz  => 'Mozambique',
  na  => 'Namibia',
  nc  => 'New Caledonia',
  ne  => 'Niger',
  nf  => 'Norfolk Island',
  ng  => 'Nigeria',
  ni  => 'Nicaragua',
  nl  => 'The Netherlands',
  no  => 'Norway',
  np  => 'Nepal',
  nr  => 'Nauru',
  nu  => 'Niue',
  nz  => 'New Zealand',
  om  => 'Oman',
  pa  => 'Panama',
  pe  => 'Peru',
  pf  => 'French Polynesia',
  pg  => 'Papua New Guinea',
  ph  => 'Philippines',
  pk  => 'Pakistan',
  pl  => 'Poland',
  pm  => 'St. Pierre & Miquelon',
  pn  => 'Pitcairn Islands',
  pr  => 'Puerto Rico',
  ps  => 'Palestinian Territories',
  pt  => 'Portugal',
  pw  => 'Palau',
  py  => 'Paraguay',
  qa  => 'Qatar',
  re  => 'Réunion',
  ro  => 'Romania',
  rs  => 'Serbia',
  ru  => 'Russia',
  rw  => 'Rwanda',
  sa  => 'Saudi Arabia',
  sb  => 'Solomon Islands',
  sc  => 'Seychelles',
  sd  => 'Sudan',
  se  => 'Sweden',
  sg  => 'Singapore',
  sh  => 'St. Helena',
  si  => 'Slovenia',
  sj  => 'Svalbard & Jan Mayen',
  sk  => 'Slovakia',
  sl  => 'Sierra Leone',
  sm  => 'San Marino',
  sn  => 'Senegal',
  so  => 'Somalia',
  sr  => 'Suriname',
  ss  => 'South Sudan',
  st  => 'São Tomé & Príncipe',
  sv  => 'El Salvador',
  sx  => 'Sint Maarten',
  sy  => 'Syria',
  sz  => 'Eswatini',
  ta  => 'Tristan Da Cunha',
  tc  => 'Turks & Caicos Islands',
  td  => 'Chad',
  tf  => 'French Southern Territories',
  tg  => 'Togo',
  th  => 'Thailand',
  tj  => 'Tajikistan',
  tk  => 'Tokelau',
  tl  => 'Timor-Leste',
  tm  => 'Turkmenistan',
  tn  => 'Tunisia',
  to  => 'Tonga',
  tr  => 'Turkey',
  tt  => 'Trinidad & Tobago',
  tv  => 'Tuvalu',
  tw  => 'Taiwan',
  tz  => 'Tanzania',
  ua  => 'Ukraine',
  ug  => 'Uganda',
  um  => 'U.S. Outlying Islands',
  un  => 'United Nations',
  us  => 'United States',
  uy  => 'Uruguay',
  uz  => 'Uzbekistan',
  va  => 'Vatican City',
  vc  => 'St. Vincent & Grenadines',
  ve  => 'Venezuela',
  vg  => 'British Virgin Islands',
  vi  => 'U.S. Virgin Islands',
  vn  => 'Vietnam',
  vu  => 'Vanuatu',
  wf  => 'Wallis & Futuna',
  ws  => 'Samoa',
  xk  => 'Kosovo',
  ye  => 'Yemen',
  yt  => 'Mayotte',
  za  => 'South Africa',
  zm  => 'Zambia',
  zw  => 'Zimbabwe',
;

# helper sub for creating regional flags
my sub regional($country, $region) {
    my str @parts = "WAVING BLACK FLAG";
    @parts.push("TAG LATIN SMALL LETTER $_") for $country.comb;
    @parts.push("TAG LATIN SMALL LETTER $_") for $region.comb;
    @parts.push("CANCEL TAG");
    @parts.join(", ").uniparse
}

# supported flag mapping
my constant %flags is export = do {

    # special cases
    my %hash =
      black       => "WAVING BLACK FLAG".uniparse,
      california  => regional("US","CA"),
      chequered   => "CHEQUERED FLAG".uniparse,
      crossed     => "CROSSED FLAGS".uniparse,
      england     => regional("GB","ENG"),
      pirate      => "WAVING BLACK FLAG, ZERO WIDTH JOINER,
                      SKULL AND CROSSBONES, VARIATION SELECTOR-16".uniparse,
      rainbow     => "WAVING WHITE FLAG, VARIATION SELECTOR-16,
                      ZERO WIDTH JOINER, RAINBOW".uniparse,
      scotland    => regional("GB","SCT"),
      texas       => regional("US","TX"),
      transgender => "WAVING WHITE FLAG, VARIATION SELECTOR-16,
                      ZERO WIDTH JOINER, TRANSGENDER SYMBOL,
                      VARIATION SELECTOR-16".uniparse,
      triangular  => "TRIANGULAR FLAG ON POST".uniparse,
      wales       => regional("GB","WLS"),
      white       => "WAVING WHITE FLAG".uniparse,

      an => ric(any(<cw sx bq>)),
      bu => ric("mm"),
      cs => ric(any(<rs me>)),
      dd => ric("de"),
      fx => ric("fr"),
      nt => ric(any(<sa iq>)),
      qu => ric("eu"),
      su => ric(any(<am az by ee ge kz kg lv lt md ru tj tm ua uz>)),
      tp => ric("tl"),
      yd => ric("ye"),
      yu => ric(any(<rs me>)),
      zr => ric("cd"),
    ;

    # add all the countries
    %hash{$_} = ric($_) for %ric.keys;

    # make sure it's immutable
    %hash.Map does LowerCaseKey
}

# supported regions with their names
my constant %regions is export = do {

    # standard countries + special cases
    my %hash = %ric,
      california => 'California',
      england    => 'England',
      scotland   => 'Scotland',
      texas      => 'Texas',
      wales      => 'Wales',
    ;

    # make sure it's immutable
    %hash.Map does LowerCaseKey
}

# deprecated regions with their names
my constant %deprecated is export = do {
    my %hash =
      an => 'Netherlands Antilles',
      bu => 'Burma',
      cs => 'Serbia and Montenegro',
      dd => 'German Democratic Republic',
      fx => 'Metropolitan France',
      nt => 'Neutral Zone',
      qu => 'European Union',
      su => 'Union of Soviet Socialist Republics',
      tp => 'East Timor',
      yd => 'Democratic Yemen',
      yu => 'Yugoslavia',
      zr => 'Zaire',
    ;

    # make sure it's immutable
    %hash.Map does LowerCaseKey
}

=begin pod

=head1 NAME

Text::Flags - easy interface to Unicode flags

=head1 SYNOPSIS

=begin code :lang<raku>

use Text::Flags;

say "This is the flag of %regions<NL>: %flags<NL>"

=end code

=head1 DESCRIPTION

Text::Flags provides an easy interface to the Unicode codepoints that render
as flags, and their associated regions and names.

It also contains a command-line interface C<tf> that either takes any number
of flag identifiers (e.g. C<tf chequered> will show 🏁).  This also takes an
optional C<--list> argument to show all supported flags, and a C<--verbose>
argument to show additional information about the indicated flag(s).

=head1 EXPORTED HASHES

=head2 %flags

=begin code :lang<raku>

say %flags<chequered>;   # 🏁

=end code

The C<%flags> hash contains the mapping of country / region codes and some
special flags, to their associated Unicode representations.  Please note that
some flags, or possibly all flags,  may not render correctly on your platform,
even if they are valid Unicode representations.  Keys can be specified in
either uppercase or lowercase.

You can use the C<.keys> method to find out which flags are supported.  Please
note that only lowercase keys will be returned.

Note that flags of deprecated countries / regions B<may> consist of a
junction of possible renderings.

=head2 %regions

=begin code :lang<raku>

say %regions<NL>;   # The Netherlands

=end code

The C<%regions> hash contains the mapping of country / region codes to their
associated name.  Keys can be specified in either uppercase or lowercase.

You can use the C<.keys> method to find out which regions are supported.
Please note that only lowercase keys will be returned.

=head2 %deprecated

=begin code :lang<raku>

say %deprecated<BU>;   # Burma

=end code

The C<%deprecated> hash contains the mapping of deprecated country / region
codes to their associated name.  Keys can be specified in either uppercase
or lowercase.

You can use the C<.keys> method to find out which deprecations are known.
Please note that only lowercase keys will be returned.

=head1 EXPORTED SUBROUTINES

=head2 ric

=begin code :lang<raku>

say ric("NL").uninames;  # (REGIONAL INDICATOR SYMBOL LETTER N REGIONAL INDICATOR SYMBOL LETTER L)

=end code

The C<ric> subroutine performs a Regional Indicator case conversion on a
given string.  Any letter (either lowercase or uppercase) is converted to its
associated Regional Indicator version, e.g. "a" (also known as
"LATIN SMALL LETTER A") is converted to "REGIONAL INDICATOR SYMBOL LETTER A".

This is primarily intended as a helper subroutine, but may have other uses
outside of this module.

=head1 SUPPORTED FLAGS

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

  an bu cs dd fx nt qu su tp yd yu zr

  england scotland wales

  california texas

  black chequered crossed pirate rainbow transgender triangular white

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Text-Flags . Comments and
Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2020, 2021, 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
