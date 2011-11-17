#!perl
use strict;
use warnings;

use Module::Underscore ':all';
use Test::More;                      # last test to print

my %underscore_to_module = (
    'test' => 'Test',
    'test_' => 'Test::',
    'test_app' => 'Test::App',
    'test::app' => 'Test::App',
    'test__app' => 'Test::App',
    'test29' => 'Test29',
    'test_29' => 'Test::29',
    "hello my friend" => 'Hello::My::Friend',
);

plan tests => scalar keys %underscore_to_module;

while(my ($underscore_string, $module_string) = each %underscore_to_module) {
    is(underscore_to_module($underscore_string), $module_string, "$underscore_string is transformed into $module_string");
}

done_testing;
