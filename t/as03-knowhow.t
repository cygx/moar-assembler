#!/usr/bin/env perl6
use v6;
use Test;
use nqp;

plan 4;

unlink 't/knowhow.moarvm';
my $nqp = $*EXECUTABLE.flip.subst('6lrep', 'pqn').flip;
is qqx{"$nqp" moaras -x t/knowhow.asm}, '', 'assemble';

nqp::loadbytecode('t/knowhow.moarvm');
my &create := nqp::hllize(nqp::gethllsym('asm', 'create_knowhow_type'));
my $type := create('Dummy');

is $type.^name, 'Dummy', 'name';
is $type.REPR, 'KnowHOWREPR', 'repr';
is $type.HOW.^name, 'KnowHOW', 'how';
