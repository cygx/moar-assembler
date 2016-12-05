#!/usr/bin/env perl6
use v6;
use Test;

use lib '.';
use t::run;

my @scripts =
    't/loop.tiny' => '54321',
    't/do.tiny' => 'ok';

plan +@scripts;
is ~run-perl6('moartl0', '--run', .key), .value, .key
    for @scripts;
