#!perl
use strict;
use warnings;

use Module::Underscore ':all';
use Test::More;                      # last test to print

my %module_to_underscore = (
    'Test' => 'test',
    'Test::App' => 'test_app',
    'test_app' => 'test_app',
    'hello my friend' => 'hello_my_friend',
    'Test::' => 'test_',
);

plan tests => scalar keys %module_to_underscore;

while(my ($module_string, $underscore_string) = each %module_to_underscore) {
    is(module_to_underscore($module_string), $underscore_string, "$module_string is transformed into $underscore_string");
}

done_testing;
