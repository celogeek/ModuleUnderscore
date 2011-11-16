package Module::Underscore;
# ABSTRACT: convert module name to underscore string name and underscore string name to module name
use strict;
use warnings;
# VERSION
use base 'Exporter';

our @EXPORT_OK = qw(
    underscore_to_module
    module_to_underscore
);

our %EXPORT_TAGS = (
    'all' => \@EXPORT_OK
);

=method underscore_to_module

underscore_to_module($underscore_string)

Transform underscore string into module string
It will replace any caracters that is not [a-z0-9] into a "::" and uppercase the letter just after

=cut
sub underscore_to_module {
    my ($underscore_string) = @_;
    my $module_string = lc($underscore_string);
    $module_string =~ s/[^a-z0-9]+(.?)/::\u$1/gx;
    $module_string = ucfirst($module_string);

    return $module_string;
}

=method module_to_underscore

module_to_underscore($module_string)

Transform module string into a underscore string
Any non word will be replace by "_"

=cut

sub module_to_underscore {
    my ($module_string) = @_;

    my $underscore_string = lc($module_string);
    $underscore_string =~ s/[^a-z0-9]+/_/gx;

    return $underscore_string;
}

1;

__END__

=head1 BUGS

Any bugs or evolution can be submit here :

L<Github|http://github.com/geistteufel/ModuleUnderscore>

=head1
