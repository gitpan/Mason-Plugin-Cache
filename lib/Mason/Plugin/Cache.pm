package Mason::Plugin::Cache;
BEGIN {
  $Mason::Plugin::Cache::VERSION = '0.01';
}
use Moose;
with 'Mason::Plugin';

1;



=pod

=head1 NAME

Mason::Plugin::Cache - Provide component cache object and filter

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    my $result = $.cache->get('key');
    if (!defined($result)) {
        ... compute $result ...
        $.cache->set('key', $result, '5 minutes');
    }

    ...

    <% $.Cache('key2', '1 hour') { %>
      <!-- this will be cached for an hour -->
    </%>

=head1 DESCRIPTION

Adds a C<cache> method and C<Cache> filter to access a cache (L<CHI|CHI>)
object with a namespace unique to the component.

=head1 INTERP PARAMETERS

=over

=item cache_defaults

Hash of parameters passed to cache constructor. Defaults to

    driver=>'File', root_dir => 'DATA_DIR/cache'

which will create a basic file cache under Mason's L<data directory|data_dir>.

=item cache_root_class

Class used to create a cache. Defaults to L<CHI|CHI>.

=back

=head1 COMPONENT METHODS

=over

=item cache

Returns a new cache object with the namespace set to the component's path.
Parameters to this method, if any, are combined with L<cache_defaults> and
passed to the L<cache_root_class> constructor.  The cache object is memoized
when no parameters are passed.

=back

=head1 FILTERS

=over

=item Cache ($key, $set_options, [%cache_params])

Caches the content using C<< $self->cache >> and the supplied cache I<$key>.
I<$set_options>, if provided, is passed as the third argument to C<<
$self->cache->set >> - it is usually an expiration time. I<%cache_params>, if
any, are passed to C<< $self->cache >>.

    <% $.Cache($my_key, '1 hour') { %>
      <!-- this will be cached for an hour -->
    </%>

=back

=head1 AUTHOR

Jonathan Swartz <swartz@pobox.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jonathan Swartz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

